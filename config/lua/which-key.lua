local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- wk.register(
--   {
--     { "<leader>f", group = "telescope" },
--     { "<leader>g", group = "git" },
--     { "<leader>gb", ":G blame<cr>", desc = "git blame" },
--     { "<leader>gc", ":Git commit<cr>", desc = "commit" },
--     { "<leader>gd", ":Gdiffsplit<cr>", desc = "git diff" },
--     { "<leader>gg", ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>", desc = "add file and commit" },
--     { "<leader>gm", ": lua SelectGitModified()<cr>", desc = "select git modified" },
--     { "<leader>gp", ":G push<cr>", desc = "git push" },
--     { "<leader>gs", ":! git status<cr>", desc = "git status" },
--     { "<leader>gw", ":Gw<cr>", desc = "git add" },
--   })
-- 	f = {
-- 		name = "telescope", -- optional group name
-- 		-- f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
-- 		-- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
-- 		-- n = { "New File" }, -- just a label. don't create any mapping
-- 		-- e = "Edit File", -- same as above
-- 		-- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
-- 		-- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
-- 	},
-- 	g = {
-- 		name = "git",
-- 		w = { ":Gw<cr>", "git add" },
-- 		g = { ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>", "add file and commit" },
-- 		c = { ":Git commit<cr>", "commit" },
-- 		s = { ":! git status<cr>", "git status" },
-- 		d = { ":Gdiffsplit<cr>", "git diff" },
-- 		b = { ":G blame<cr>", "git blame" },
-- 		p = { ":G push<cr>", "git push" },
-- 		m = { ": lua SelectGitModified()<cr>", "select git modified" },
-- 	},
-- }, { prefix = "<leader>" })

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},

	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specifiy a list manually
	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
	-- triggers_blacklist = {
	-- 	-- list of mode / prefixes that should never be hooked by WhichKey
	-- 	-- this is mostly relevant for keymaps that start with a native binding
	-- 	i = { "j", "k" },
	-- 	v = { "j", "k" },
	-- },
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = {},
	},
})
