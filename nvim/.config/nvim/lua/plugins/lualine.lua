return {
    "nvim-lualine/lualine.nvim",
    -- lazy = false,
    event = { "BufModifiedSet", "BufNew" },
    enabled = false,
    opts = {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            section_separators = { left = "", right = "" },
            component_separators = ''
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                { "branch", icon = "" },
                { "diagnostics", sources = { "nvim_diagnostic", "coc" } },
            },
            lualine_c = { { "filename", path = 4 } },
            lualine_x = { "filetype" },
            lualine_y = { "%S" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            -- lualine_a = {},
            -- lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            -- lualine_y = {},
            -- lualine_z = {},
        },
        winbar = {
            lualine_c = { { "filename", path = 4 } },
        },
        inactive_winbar = {
            lualine_c = { { "filename", path = 4 } },
        }
        -- tabline = {},
        -- extensions = {},
    }
}
