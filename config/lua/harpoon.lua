require("harpoon").setup({})


local opt = { noremap = true }

vim.api.nvim_set_keymap("n", "zh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opt)
vim.api.nvim_set_keymap("n", "zm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opt)
vim.keymap.set("n", "zj", function () require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "zk", function () require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "zl", function () require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<leader>j", function () require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>k", function () require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<leader>l", function () require("harpoon.ui").nav_file(3) end)
