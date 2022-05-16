return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
    ---- colorschemes
	use 'morhetz/gruvbox'
    use 'Mofiqul/dracula.nvim'
    ---- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use { 'tami5/lspsaga.nvim', config = function () require('lspsaga').setup() end }
    ---- cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/vim-vsnip'
    ---- snippets
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    ---- programming utils
    use 'lervag/vimtex'
    use 'davidgranstrom/nvim-markdown-preview'
    use 'CRAG666/code_runner.nvim'
    ----
    use 'terrortylor/nvim-comment'
    use { 'windwp/nvim-autopairs', config = function () require('nvim-autopairs').setup() end }
    use { 'nvim-lualine/lualine.nvim', requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use { 'nvim-telescope/telescope.nvim', requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        }
    }
    use 'mhinz/vim-startify'
    use 'voldikss/vim-floaterm'
    use { 'lewis6991/gitsigns.nvim', config = function () require('gitsigns').setup() end }
end)
