local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("recent_files")
vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", {desc = "find files", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fr", ":lua require('telescope').extensions.recent_files.pick()<CR>", {desc = "recent files", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", ":lua require('telescope.builtin').command_history()<CR>", {desc = "command history", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ft", ":lua require('telescope.builtin').builtin()<CR>", {desc = "telescope", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", {desc = "grep", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fe", ":lua require('telescope.builtin').help_tags()<CR>", {desc = "help tags", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fc", ":lua require('telescope.builtin').commands()<CR>", {desc = "commands", noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", {desc = "buffers", noremap = true})
