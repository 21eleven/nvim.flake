--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<left>", "0")
vim.keymap.set("n", "<right>", "$")
vim.keymap.set("n", "<up>", "kkkkkkk")
vim.keymap.set("n", "<down>", "jjjjjjj")
vim.keymap.set("v", "<up>", "kkkkkkk")
vim.keymap.set("v", "<down>", "jjjjjjj")
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end
vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader><leader>w", ":wq!<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader><leader>q", ":qa!<cr>")

vim.keymap.set("n", "<leader>j", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>k", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>tt", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>tc", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>to", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>x", ":Bdelete<CR>")

local bufopts = { noremap = true, silent = true}
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- vim.keymap.set("n", ",ar", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
vim.keymap.set(
	"n",
	"[e",
	":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"
)
vim.keymap.set(
	"n",
	"]e",
	":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"
)
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
