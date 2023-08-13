require("lualine").setup({
    options = {
        -- theme = "gruvbox-material",
        -- theme = "rose-pine",
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {
            winbar = { "NvimTree", "fugitive", "no-neck-pain" },
        },
    },
    sections = {
        lualine_c = { "require('lsp-status').status()",  require('auto-session.lib').current_session_name }
    },
    -- winbar = {
    --     lualine_c = { "filename" },
    -- },
    -- inactive_winbar = {
    --     lualine_c = { "filename" },
    -- },
    -- tabline = {
    --     lualine_a = { {
    --         "tabs",
    --         mode = 2,
    --     } },
    -- },
})
