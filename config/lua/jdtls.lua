local ok, jdtls = pcall(require, "jdtls")
if not ok then
	return
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local jdtls_setup = require("jdtls.setup")

local function get_cmd(workspace_dir)
	if vim.fn.executable("jdtls") == 1 then
		return { "jdtls", "-data", workspace_dir }
	end

	return { "jdt-language-server", "-data", workspace_dir }
end

local function start_jdtls()
	local root_dir = jdtls_setup.find_root(root_markers)
	if not root_dir or root_dir == "" then
		return
	end

	local project_name = vim.fn.fnamemodify(root_dir, ":t")
	local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

	local cmd = get_cmd(workspace_dir)
	if vim.fn.executable(cmd[1]) == 0 then
		vim.notify("Unable to start jdtls: install either `jdtls` or `jdt-language-server`.", vim.log.levels.WARN)
		return
	end

	local config = {
		cmd = cmd,
		root_dir = root_dir,
		capabilities = cmp_capabilities,
		settings = {
			java = {
				eclipse = { downloadSources = true },
				configuration = { updateBuildConfiguration = "interactive" },
				maven = { downloadSources = true },
				references = { includeDecompiledSources = true },
				saveActions = { organizeImports = true },
				sources = { organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 } },
			},
		},
		on_attach = function(client, bufnr)
			if type(Generic_on_attach) == "function" then
				Generic_on_attach(client, bufnr)
			end

			pcall(jdtls.setup_dap, { hotcodereplace = "auto" })
			pcall(function()
				require("jdtls.dap").setup_dap_main_class_configs()
			end)
			jdtls_setup.add_commands()
		end,
	}

	jdtls.start_or_attach(config)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	callback = start_jdtls,
})
