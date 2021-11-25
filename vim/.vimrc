let mapleader=" "

set nocompatible " Use Vim defaults (much better!)
set bs=2 " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set ttimeoutlen=5

set autoindent
filetype plugin indent on
set autoread
set mouse=a

set number
set relativenumber
" set wrap

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start
set hidden
set laststatus=2
set guicursor=i:block

set scrolloff=8
set autochdir
" set signcolumn=yes

" set termguicolors
set cursorline
" set colorcolumn=80
if &term =~ '256color'
    set t_ut=
endif

" PLUGINS-----
call plug#begin('~/.vim/plugged' )
	Plug 'lervag/vimtex'

    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    Plug 'gruvbox-community/gruvbox'
    Plug 'tomasr/molokai'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'gosukiwi/vim-atom-dark'

    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'jiangmiao/auto-pairs'
    Plug 'Spenny1068/ciBracket'
    Plug 'tpope/vim-surround'

    Plug 'theniceboy/vim-calc'
call plug#end()

" Edit vimrc
:nmap <Leader>ve :e $MYVIMRC<CR>
" Reload vimrc
:nmap <Leader>vr :so %<CR>

" Guardar y salir
:imap jk <ESC>
:nmap <Leader>w :w<CR>
:nmap <Leader>wq :wq<CR>
:nmap <Leader>q :q<CR>

" Exit visual mode
vnoremap oo <ESC>

" window movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>cw :wincmd q<CR>
nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>pv :Lex <bar> :wincmd =<CR>

" visual movements
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" buffer movements
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bd :bd<CR>
" :buffer some_partial_buffer_name
nnoremap <leader>bb :buffer 

" netrw
let g:netrw_browse_split=0
let g:netrw_liststyle=3
let g:netrw_keepdir=0
 
" Git
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
 
" Colorscheme
colorscheme gruvbox
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme onehalfdark
" colorscheme atom-dark-256
set background=dark

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Latex
let g:latex_view_general_viewer="zathura"
let g:vimtex_view_method="zathura"
let g:tex_flavor="latex"
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning=0
let g:Tex_IgnoreLevel=8
 
" Calculator
nnoremap <C-c> :call Calc()<CR>
inoremap <C-c> <ESC>:call Calc()<CR>

set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo

set nomodeline
syntax on
