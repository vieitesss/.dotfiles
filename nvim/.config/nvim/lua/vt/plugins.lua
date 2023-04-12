local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>ps", "<cmd>lua require('lazy').sync()<cr>", { silent = true })

return require("lazy").setup('plugins', {
    defaults = {
        lazy = true,
        version = "*"
    },
    install = {
        colorscheme = { "kanagawa" }
    },
    checker = { enabled = true },
    change_detection = { notify = false }
})
