{ pkgs }:
with pkgs; [
    ripgrep
    stylua
    # nix
    statix
    rnix-lsp
    # packages with results in /lib/node_modules/.bin must come at the end
    # pyright
    nodePackages.typescript
    nodePackages.typescript-language-server
]
