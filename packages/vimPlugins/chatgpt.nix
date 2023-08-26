{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "chatgpt";
  inherit src;
}
