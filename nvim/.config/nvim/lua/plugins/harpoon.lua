return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true } },
        { "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", { silent = true } },
        { "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>", { silent = true } },
        { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>", { silent = true } },
        { "<leader>j", ":lua require('harpoon.ui').nav_file(1)<cr>", { silent = true } },
        { "<leader>k", ":lua require('harpoon.ui').nav_prev(2)<cr>", { silent = true } },
        { "<leader>l", ":lua require('harpoon.ui').nav_prev(3)<cr>", { silent = true } },
        { "<leader>;", ":lua require('harpoon.ui').nav_prev(4)<cr>", { silent = true } },
    }
}
