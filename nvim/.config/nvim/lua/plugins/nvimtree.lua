vim.g.loaded_vetrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "kyazdani42/nvim-tree.lua",
    keys = {
        { "<leader>pv", "<cmd>NvimTreeToggle<cr>" }
    },
    opts = {
        hijack_netrw = true,
        actions = {
            open_file = {
                quit_on_open = true
            }
        },
        view = {
            relativenumber = true,
            adaptive_size = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true
        }
    }
}
