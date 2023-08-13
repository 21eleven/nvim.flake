{
  description = "21eleven nvim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
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
  };
  outputs = { self, nixpkgs, neovim, telescope-recent-files-src, rose-pine-src, bufdelete-src }:
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
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
        };
      };
      overlayNvim = prev: final: {
        nvim = import ./packages/nvim.nix {
          pkgs = final;
        };
      };
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayNvim ];
      };
    in
    {
      packages.x86_64-linux.default = pkgs.nvim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.nvim}/bin/nvim";
      };
    };
}
