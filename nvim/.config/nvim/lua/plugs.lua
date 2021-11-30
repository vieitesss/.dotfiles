return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use {
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup()
        end
	}
	use{
        'nvim-lualine/lualine.nvim', 
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'mfussenegger/nvim-jdtls'
end)
