local status, treesitter = pcall(require, 'nvim-treesitter')
if not status then return end

local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = { "bash", "c", "java", "python", "latex", "html", "json", "cpp", "lua", "toml", "vim" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
