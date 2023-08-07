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
  vim-fugitive
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp-nvim-ultisnips
  cmp-emoji
  lualine-nvim
  lsp-status-nvim
  telescope-nvim
  rose-pine
  harpoon
  nvim-lspconfig
  telescope-recent-files
]
