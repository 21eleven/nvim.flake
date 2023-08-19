require("leap").add_default_mappings()
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

