return {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function ()
        require('nvim-tmux-navigation').setup({
            disable_when_zoomed = true,
            keybindings = {
                left = "<C-h>",
                right = "<C-l>",
                down = "<C-j>",
                up = "<C-k>"
            }
        })
    end
}
