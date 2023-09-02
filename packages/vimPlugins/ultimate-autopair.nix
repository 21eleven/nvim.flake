{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "ultimate-autopair-nvim";
  inherit src;
}
