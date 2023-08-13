-- local cmp = require("cmp")
-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- vim.keymap.set("i", "<C-n>", cmp.complete, bufopts)
-- cmp.setup({
-- 	completion = {
-- 		autocomplete = false,
-- 	},
-- 	-- performance = {
-- 	-- 	debounse = 120,
-- 	-- 	throttle = 60,
-- 	-- },
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
-- 		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
-- 		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
-- 		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
-- 		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
-- 		["<C-e>"] = cmp.mapping({
-- 			i = cmp.mapping.abort(),
-- 			c = cmp.mapping.close(),
-- 		}),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 	},
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" },
-- 		{ name = "ultisnips" }, -- For ultisnips users.
-- 		{ name = "emoji" },
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })
--
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
--
-- Set up nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "vsnip" }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "emoji" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
cmp.setup.filetype('markdown', {
  sources = {
    { name = 'emoji', option = { insert = true } },
  }
})
