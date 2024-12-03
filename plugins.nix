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
      p.gleam
    ]
  ))
  vim-repeat
  vim-fugitive
  gitsigns-nvim
  auto-session
  nvim-web-devicons
  bufferline-nvim
  # colorschemes
  dracula-nvim
  catppuccin-nvim
  tokyonight-nvim
  onedark-nvim
  oxocarbon-nvim
  kanagawa-nvim
  nordic-nvim
  onenord-nvim
  # caret-nvim
  everforest
  sonokai
  # /colorschemes
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  # cmp-nvim-ultisnips
  cmp-emoji
  cmp_luasnip
  luasnip
  indent-blankline-nvim
  which-key-nvim
  neo-tree-nvim
  plenary-nvim
  nui-nvim
  chatgpt-nvim
  no-neck-pain-nvim
  toggleterm-nvim
  rust-tools-nvim
  # ferris-nvim
  leap-nvim
  neodev-nvim
  flit-nvim
  comment-nvim
  lualine-nvim
  lsp-status-nvim
  telescope-nvim
  rose-pine
  smart-splits-nvim
  bufdelete-nvim
  # ultimate-autopair-nvim # disable as it was causing crashing
  nvim-autopairs
  harpoon
  nvim-lspconfig
  telescope-recent-files
  goto-preview
  nvim-lightbulb
  lean-nvim
  dressing-nvim
  nvim-web-devicons
  avante-nvim
  # render-markdown-nvim
]
