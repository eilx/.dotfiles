return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		priority = 1000,
		opts = {
			disable_background = true,
			disable_float_background = true,
			disable_italics = true,
		},
		init = function()
			vim.cmd 'colorscheme rose-pine'
		end
	},
}
