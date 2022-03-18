return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use 'windwp/nvim-autopairs'
    use{
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        }
    }
    use 'tami5/lspsaga.nvim'
    use 'terrortylor/nvim-comment'
    use 'lervag/vimtex'
    use 'mhinz/vim-startify'
    use 'voldikss/vim-floaterm'
end)
