local opt = { noremap = true }
-- vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>gw", ":Gw<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>gg", ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>gs", ":! git status<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<cr>", opt)
SelectGitModified = function()
    vim.ui.select(
        vim.fn.split(
            vim.fn.system('git diff --name-only'),
            '\n'
        ),
        { prompt = "unstaged files" },
        function(f) vim.api.nvim_command("e " .. f) end
    )
end
-- vim.api.nvim_set_keymap("n", "<leader>gm", ": lua SelectGitModified()<cr>", opt)

-- i donno why... but these kep maps don't appear to get respected...
-- vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<cr>")
-- vim.keymap.set("n", "<leader>gw", ":Gw<cr>")
-- vim.keymap.set("n", "<leader>gg", ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>")
-- vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
-- vim.keymap.set("n", "<leader>gs", ":! git status<cr>")
-- vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<cr>")
-- vim.keymap.set("n", "<leader>gm", ": lua SelectGitModified()<cr>")
