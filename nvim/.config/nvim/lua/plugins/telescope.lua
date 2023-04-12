return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    cmd = "Telescope",
    keys = {
        { "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { "<Leader>dot", "<cmd>lua require('vt.telescope').search_dotfiles()<cr>", { silent = true } },
        { "<Leader>nv", "<cmd>lua require('vt.telescope').search_nvim()<cr>", { silent = true } },
        { "<Leader>fir", "<cmd>lua require('vt.telescope').search_in_repo()<cr>", { silent = true } },
    },
    config = function()
        local actions = require('telescope.actions')

        require('telescope').setup({
            defaults = {
                --file_sorter = require'telescope.sorters'.get_fzy_sorter,
                prompt_prefix = " >",
                color_devicons = true,

                file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                -- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                    -- cwd = "~/",
                    mappings = {
                        i = {
                            ["<C-s>"] = actions.file_split
                        }
                    }
                },
                buffers = {
                    initial_mode = "normal",
                    show_all_buffers = true,
                    sort_lastused = true,
                    theme = "dropdown",
                    previewer = false,
                    mappings = {
                        n = {
                            ["dd"] = actions.delete_buffer,
                            ["s"] = actions.add_selection,
                            ["S"] = actions.remove_selection,
                        },
                    },
                },
                lsp_references = {
                    initial_mode = "normal",
                },
            },
        })
    end
}
