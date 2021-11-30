require('nvim-autopairs').setup{}

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use 'windwp/nvim-autopairs'
end)
