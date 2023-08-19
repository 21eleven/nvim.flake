local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'NvimTree', "neo-tree" },
  callback = function(args)
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
        return true
      end
    })
  end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = {"nix", "lua"},
    command = "setlocal shiftwidth=2 tabstop=2",
})
