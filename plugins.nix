{ pkgs }:
with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        p: [
          p.javascript
          p.typescript
          p.json
          p.lua
          p.html
          p.bash
          p.css
          p.jsdoc
          p.nix
          p.scss
          p.tsx
          p.rust
        ]
      ))
    telescope-nvim
    rosepine
    harpoon
    nvim-lspconfig
    telescope-recent-files
]
