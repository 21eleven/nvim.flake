{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "bufdelete";
  inherit src;
}
