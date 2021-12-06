local keymap = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
local n = { noremap = true }
local s = { silent = true }
vim.g.mapleader = ' '

----- Normal -----
------------------

-- save and quit
keymap('n', '<Leader>w', ':w<CR>', {})
keymap('n', '<Leader>q', ':q<CR>', {})
keymap('n', '<Leader>wq', ':wq<CR>', {})

-- no highlight
keymap('n', '<Leader>no', ':noh<CR>', ns)

-- window movements
keymap('n', '<Leader>h', ':wincmd h<CR>', n)
keymap('n', '<Leader>j', ':wincmd j<CR>', n)
keymap('n', '<Leader>k', ':wincmd k<CR>', n)
keymap('n', '<Leader>l', ':wincmd l<CR>', n)
keymap('n', '<Leader>H', ':wincmd H<CR>', n)
keymap('n', '<Leader>J', ':wincmd J<CR>', n)
keymap('n', '<Leader>K', ':wincmd K<CR>', n)
keymap('n', '<Leader>L', ':wincmd L<CR>', n)
keymap('n', '<Leader>o', ':wincmd o<CR>', n)
keymap('n', '<Leader>cw', ':wincmd q<CR>', n)
keymap('n', '<Leader>=', ':vertical resize +10<CR>', n)
keymap('n', '<Leader>-', ':vertical resize -10<CR>', n)

-- buffer movements
keymap('n', '<Leader>bp', ':bprev<CR>', {})
keymap('n', '<Leader>bn', ':bnext<CR>', {})
keymap('n', '<Leader>bd', ':bd<CR>', {})
keymap('n', '<Leader>bb', ':buffer', {})

-- edit init.lua
keymap('n', '<Leader>ve', ':e ~/.config/nvim/init.lua<CR>', s)

-- reload file
keymap('n', '<Leader>rf', ':so %<CR>', s)

-- packer
keymap('n', '<Leader>ps', ':PackerSync<CR>', n)

-- lsp
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', ns)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', ns)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', ns)
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', ns)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', ns)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', ns)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', ns)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', ns)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', ns)
keymap('n', '<space>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', ns)
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', ns)

-- nvim-tree
keymap('n', '<Leader>pv', ':NvimTreeToggle<CR>', ns)

-- telescope
keymap('n', '<Leader>ff', ':Telescope', n)
keymap('n', '<Leader>dot', [[:lua require'plugins.telescope'.search_dotfiles()<CR>]], ns)

-- java
keymap('n', '<Leader>jr', ':vsplit term://java %<CR>', ns)

-- python
keymap('n', '<Leader>pr', ':vsplit term://python3 %<CR>', ns)

----- Insert -----
------------------
-- quit
keymap('i', 'jk', '<Esc>', {})

----- Visual -----
------------------

-- quit
keymap('v', 'oo', '<Esc>', {})

-- move lines
keymap('v', 'J', ':m \'>+1<CR>gv=gv', n)
keymap('v', 'K', ':m \'>-2<CR>gv=gv', n)

-- copy
keymap('x', '<C-c>', [["+y]], s)
