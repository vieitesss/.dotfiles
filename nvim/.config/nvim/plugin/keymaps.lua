local keymap = vim.keymap.set
local s = { silent = true }
vim.g.mapleader = ' '

----- Normal -----
------------------

-- save and quit
keymap('n', '<Leader>ww', ':w!<CR>')
keymap('n', '<Leader>q', ':q<CR>')
keymap('n', '<Leader>Q', ':wq<CR>')

-- no highlight
keymap('n', '<Leader>no', ':noh<CR>', s)

-- window movements
keymap('n', '<Leader>h', ':wincmd h<CR>')
keymap('n', '<Leader>j', ':wincmd j<CR>')
keymap('n', '<Leader>k', ':wincmd k<CR>')
keymap('n', '<Leader>l', ':wincmd l<CR>')
keymap('n', '<Leader>H', ':wincmd H<CR>')
keymap('n', '<Leader>J', ':wincmd J<CR>')
keymap('n', '<Leader>K', ':wincmd K<CR>')
keymap('n', '<Leader>L', ':wincmd L<CR>')
keymap('n', '<Leader>o', ':wincmd o<CR>')
keymap('n', '<C-Left>', ':vertical resize +5<CR>')
keymap('n', '<C-Right>', ':vertical resize -5<CR>')
keymap('n', '<C-Down>', ':resize +3<CR>')
keymap('n', '<C-Up>', ':resize -3<CR>')

-- buffer movements
keymap('n', '<Leader>bp', ':bprev<CR>')
keymap('n', '<Leader>bn', ':bnext<CR>')
keymap('n', '<Leader>bd', ':bd<CR>')
keymap('n', '<Leader>bb', ':buffer')

-- reload file
keymap('n', '<Leader>so', ':so %<CR>', s)

-- Run File
keymap('n', '<Leader>rf', '<cmd>RunCode<CR>', s)

-- Treesitter
keymap('n', '<Leader>rt', '<cmd>e<CR>', s)

-- packer
keymap('n', '<Leader>ps', ':PackerSync<CR>')

-- lsp
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', s)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', s)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', s)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', s)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', s)
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', s)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', s)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', s)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', s)
keymap('n', 'gr', ':Telescope lsp_references<CR>', s)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', s)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', s)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', s)
keymap('n', '<space>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', s)
keymap('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', s)

-- nvim-tree
-- keymap('n', '<Leader>pv', ':NvimTreeToggle<CR>', s)

-- telescope
keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
keymap('n', '<Leader>fp', [[<cmd>lua require('telescope').extensions.project.project()<CR>]])
keymap('n', '<Leader>pv', [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>]], s)
keymap('n', '<Leader>dot', [[:lua require'vt.telescope'.search_dotfiles()<CR>]], s)
keymap('n', '<Leader>pro', [[:lua require'vt.telescope'.search_projects()<CR>]], s)
keymap('n', '<Leader>nv', [[:lua require'vt.telescope'.search_nvim()<CR>]], s)

-- floaterm
keymap('n', '<Leader>ft', ':FloatermNew<CR>', s)
keymap('n', '<Leader>t', ':FloatermToggle<CR>', s)
keymap('t', 'jk', '<C-\\><C-n>', s)

----- Insert -----
------------------
-- quit
keymap('i', 'jk', '<Esc>', {})

----- Visual -----
------------------

-- quit
keymap('v', '<Leader>o', '<Esc>', {})

-- paste without losing previous paste
keymap('v', '<Leader>p', '\"_dP', {})

-- move lines
keymap('v', 'J', ':m \'>+1<CR>gv=gv')
keymap('v', 'K', ':m \'>-2<CR>gv=gv')

-- copy
keymap('x', '<C-c>', [["+y]], s)
