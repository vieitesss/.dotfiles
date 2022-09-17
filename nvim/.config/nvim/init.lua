require 'globals'

if require 'vt.first_load' () then
  return
end

-- Leader key = <Space>
vim.g.mapleader = ' '

require 'plugins'

require 'vt/lualine'
require 'vt/lsp'
require 'vt/treesitter'
require 'vt/telescope'
require 'vt/vimtex'
require 'vt/code_runner'
require 'vt/nvimtree'
-- require 'vt/luasnip'
