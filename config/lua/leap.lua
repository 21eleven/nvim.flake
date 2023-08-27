-- require("leap").add_default_mappings()
require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
-- leap-ast?
-- leap-spooky for text objects?
vim.keymap.set("n", "<leader>s", ":lua require('leap').leap { target_windows = { vim.fn.win_getid() } }<cr>")
vim.keymap.set("n", "r", ":lua require('leap').leap { target_windows = { vim.fn.win_getid() } }<cr>")
vim.keymap.set({'n', 'x', 'o'}, 'ss', 'xi')
vim.keymap.set({'n', 'x', 'o'}, 'sk', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'sd', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'si', '<Plug>(leap-forward-till)')
vim.keymap.set({'n', 'x', 'o'}, 'sj', '<Plug>(leap-backward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'sa', '<Plug>(leap-backward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'su', '<Plug>(leap-backward-till)')
