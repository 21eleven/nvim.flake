require("harpoon").setup({})


local opt = { noremap = true }

vim.api.nvim_set_keymap("n", "zh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opt)
vim.api.nvim_set_keymap("n", "zm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opt)
