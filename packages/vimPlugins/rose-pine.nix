{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "rose-pine";
  inherit src;
}
