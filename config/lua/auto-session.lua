-- https://github.com/rmagatti/auto-session
require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/gits", "~/Downloads", "/" },
    -- pre_save_commands = {"tabdo Neotree close"},
}
