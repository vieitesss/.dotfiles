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
keymap('n', '<Leader>cw', ':wincmd q<CR>')
keymap('n', '<Leader>=', ':vertical resize +10<CR>')
keymap('n', '<Leader>-', ':vertical resize -10<CR>')

-- buffer movements
keymap('n', '<Leader>bp', ':bprev<CR>')
keymap('n', '<Leader>bn', ':bnext<CR>')
keymap('n', '<Leader>bd', ':bd<CR>')
keymap('n', '<Leader>bb', ':buffer')

-- edit init.lua
keymap('n', '<Leader>ve', ':e ~/.config/nvim<CR>', s)

-- reload file
keymap('n', '<Leader>rf', ':so %<CR>', s)

-- make session
keymap('n', '<Leader>mk', ':lua makeSession(".vim")<CR>', s)

function makeSession(dir)
    local ok, err = isdir(dir)

    if ok then
        vim.cmd([[:mksession! .vim/session.vim]])
        print("Session saved.")
    else
        os.execute("mkdir " .. dir)
        vim.cmd([[:mksession! .vim/session.vim]])
        print("Session saved.")
    end
end

--- Check if a file or directory exists in this path
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
   -- "/" works on both Unix and Windows
   return exists(path.."/")
end

-- packer
keymap('n', '<Leader>ps', ':PackerSync<CR>', n)

-- lsp
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', s)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', s)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', s)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', s)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', s)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', s)
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', s)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', s)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', s)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', s)
keymap('n', 'gr', ':Telescope lsp_references<CR>', s)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', s)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', s)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', s)
keymap('n', '<space>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', s)
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', s)

-- nvim-tree
keymap('n', '<Leader>pv', ':NvimTreeToggle<CR>', s)

-- telescope
keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
keymap('n', '<Leader>dot', [[:lua require'plugins.telescope'.search_dotfiles()<CR>]], s)

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
keymap('v', 'oo', '<Esc>', {})

-- move lines
keymap('v', 'J', ':m \'>+1<CR>gv=gv')
keymap('v', 'K', ':m \'>-2<CR>gv=gv')

-- copy
keymap('x', '<C-c>', [["+y]], s)
