# vim: ft=lua
{ pkgs }:
''
local capabilities = {}

local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local rt = require("rust-tools")
require("neodev").setup({
  override = function(root_dir, library)
    if root_dir:find("/etc/nixos", 1, true) == 1 then
      library.enabled = true
      library.plugins = true
    end
  end,
})
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            rt.inlay_hints.enable()
		end,
	},
})
capabilities = vim.tbl_extend("keep", capabilities, cmp_nvim_lsp.default_capabilities())

local lsp_status = require("lsp-status")
-- TODO configure lsp status more
-- https://github.com/nvim-lua/lsp-status.nvim
lsp_status.register_progress()
-- lsp_status.config {
--   status_symbol = "",
--   indicator_separator = "",
--   component_separator = "",
--   show_filename = false,
--   diagnostics = false,
--   current_function = false,
-- }
capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
-- local navbuddy = require("nvim-navbuddy")
-- {
--  name = "jdtls",
--  setup = {
--    cmd = { "jdt-language-server" },
--  },
-- },

local servers = {
	-- { name = "pyright" },
	-- {
	--   name = "ltex",
	--   setup = {
	--     autostart = false,
	--     filetypes = { "markdown", "gitcommit", "plaintext" },
	--   },
	-- },
	{
		name = "tsserver",
		setup = {
			init_options = {
				maxTsServerMemory = 8192,
				disableAutomaticTypingAcquisition = true,
				tsserver = {
					path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
				},
				-- preferences = {
				-- },
			},
		},
		-- on_attach = function(client, bufnr)
		--   client.server_capabilities.documentFormattingProvider = false
		--   client.server_capabilities.semanticTokensProvider = false
		--   vim.keymap.set("n", ",i", ":TSLspImportAll<CR>", bufopts)
		--   vim.keymap.set("n", ",o", ":TSLspOrganize<CR>", bufopts)
		-- end,
	},
	{
		name = "rnix",
		on_attach = function(client, bufnr)
			-- autoformat buffer on save
			local augroup = vim.api.nvim_create_augroup("rnix autoformat", { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				buffer = bufnr,
				group = augroup,
				command = "lua vim.lsp.buf.format()",
			})
		end,
	},
	{
		name = "lua_ls",
		-- on_init = function(client)
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
		-- 	local path = client.workspace_folders[1].name
		-- 	if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
		-- 		client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
		-- 			runtime = {
		-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		-- 				version = "LuaJIT",
		-- 			},
		-- 			-- Make the server aware of Neovim runtime files
		-- 			workspace = {
		-- 				library = { vim.env.VIMRUNTIME },
		-- 				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
		-- 				-- library = vim.api.nvim_get_runtime_file("", true)
		-- 			},
		-- 		})
		-- 		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		-- 	end
		-- 	return true
		-- end,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					-- path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = { vim.env.VIMRUNTIME },
          checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	},
	{
		name = "rust_analyzer",
	},
}

for _, server in pairs(servers) do
	local setup = {
		debug = true,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 3000, --150
		},
		on_attach = function(client, bufnr)
			--vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			-- vim.keymap.set("n", ",ar", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader><leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader><leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader><leader>wl", function()
				vim.inspect(vim.lsp.buf.list_workspace_folders())
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
			vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})


			lsp_status.on_attach(client)

			-- if client.server_capabilities.documentSymbolProvider then
			--   navbuddy.attach(client, bufnr)
			-- end

			if server.on_attach then
				server.on_attach(client, bufnr)
			end
		end,
	}

	if server.setup then
		for k, v in pairs(server.setup) do
			setup[k] = v
		end
	end

	nvim_lsp[server.name].setup(setup)
end
''
