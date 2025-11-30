{
  description = "21eleven nvim flake";
  inputs = {
    nixpkgs = {
      # url = "github:NixOS/nixpkgs";
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    neovim = {
      # url = "github:neovim/neovim/stable?dir=contrib";
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
    rose-pine-src = {
      url = "github:rose-pine/neovim";
      flake = false;
    };
    bufdelete-src = {
      url = "github:21eleven/bufdelete.nvim";
      flake = false;
    };
    chatgpt-src = {
      url = "github:21eleven/chatgpt.nvim";
      flake = false;
    };
    ultimate-autopair-src = {
      url = "github:altermo/ultimate-autopair.nvim";
      flake = false;
    };
    avante-src = {
      url = "github:yetone/avante.nvim";
      flake = false;
    };
  };
  outputs =
    { self
    , nixpkgs
    , neovim
    , telescope-recent-files-src
    , rose-pine-src
    , bufdelete-src
    , chatgpt-src
    , ultimate-autopair-src
    , avante-src
    }:
    let
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      overlayFlakeInputs = system: prev: final: {
        neovim = neovim.packages.${system}.neovim;
        vimPlugins = final.vimPlugins // {
          telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
          rose-pine = import ./packages/vimPlugins/rose-pine.nix {
            src = rose-pine-src;
            pkgs = prev;
          };
          bufdelete-nvim = import ./packages/vimPlugins/bufdelete.nix {
            src = bufdelete-src;
            pkgs = prev;
          };
          chatgpt-nvim = import ./packages/vimPlugins/chatgpt.nix {
            src = chatgpt-src;
            pkgs = prev;
          };
          ultimate-autopair-nvim = import ./packages/vimPlugins/ultimate-autopair.nix {
            src = ultimate-autopair-src;
            pkgs = prev;
          };
          avante-nvim = import ./packages/vimPlugins/avante.nix {
            src = avante-src;
            pkgs = prev;
          };
        };
      };
      overlayNvim = prev: final: {
        nvim = import ./packages/nvim.nix {
          pkgs = final;
        };
      };
      mkPkgs = system:
        import nixpkgs {
          inherit system;
          overlays = [ (overlayFlakeInputs system) overlayNvim ];
        };
    in
    {
      packages = forAllSystems (system: let pkgs = mkPkgs system; in { default = pkgs.nvim; });
      apps = forAllSystems (system: let pkgs = mkPkgs system; in {
        default = {
          type = "app";
          program = "${pkgs.nvim}/bin/nvim";
        };
      });
    };
}
