{ pkgs }:
with pkgs; [
  ripgrep
  stylua
  nodejs
  curl
  lua-language-server
  # nix
  statix
  nil
  # packages with results in /lib/node_modules/.bin must come at the end
  pyright
  nodePackages.typescript
  nodePackages.typescript-language-server
  # nodePackages.pyright
]
