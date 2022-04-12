vim.g.startify_session_dir = '~/.config/nvim/lua/plugins/startify/session'

vim.g.startify_lists = {
    { type = 'files', header = {'    Files'}},
    { type = 'dir', header = {'    Current Directory ' .. vim.fn.getcwd()}},
    { type = 'sessions', header = {'    Sessions'}},
    { type = 'bookmarks', header = {'    Bookmarks'}}
}

vim.g.startify_bookmarks = {
    { b = '~/.dotfiles/awesome/.config/bspwm/.config/bspwm' },
    { s = '~/.dotfiles/awesome/.config/bspwm/.config/sxhkd' },
    { d = '~/.dotfiles/awesome/.config/dunst' },
    { n = '~/.dotfiles/nvim/.config/nvim' },
    { p = '~/.dotfiles/polybar/.config/polybar' }
}
