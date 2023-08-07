{
  description = "21eleven nvim flake";
  # inputs = {
  #   nixpkgs = { url = "github:NixOs/nixpkgs"; };
  #   neovim = {
  #     url = "github:neovim/neovim/stable"; 
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  # };
  # outputs = { self, nixpkgs, neovim }: {
  #   # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
  #   # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
  #   package.x86_64-linux.default = nixpkgs.packages.x86_64-linux.neovim;
  #   apps.x86_64-linux.default = {
  #     type = "app";
  #     program = "${nixpkgs.packages.x86_64-linux.neovim}/bin/nvim";
  #   };
  # };
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
    rosepine-src = {
      url = "github:rose-pine/neovim";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, neovim, telescope-recent-files-src, rosepine-src }:
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
        vimPlugins = final.vimPlugins // {
          telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
          rosepine = import ./packages/vimPlugins/rosepine.nix {
            src = rosepine-src;
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
    in {
      packages.x86_64-linux.default = pkgs.nvim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.nvim}/bin/nvim";
      };
    };
}
