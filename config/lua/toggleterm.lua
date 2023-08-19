require("toggleterm").setup()

function Set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua Set_terminal_keymaps()')

vim.keymap.set("n", "<leader>rt", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>rh", "<cmd>ToggleTerm direction=horizontal<CR>")
vim.keymap.set('t', 'jk', "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('t', 'kj', [[<C-\><C-n>]])
