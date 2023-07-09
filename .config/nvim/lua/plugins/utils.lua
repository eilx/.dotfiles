return {
	{
		'numToStr/Comment.nvim',
		opts = {}
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {}
	},
	{
		'windwp/nvim-ts-autotag',
	},
	{
		'nacro90/numb.nvim',
		opts = {}
	},
	{
		'anuvyklack/pretty-fold.nvim',
		opts = {
			fill_char = '─'
		}
	},
	{
		'ahmedkhalf/project.nvim',
		config = function()
			require('project_nvim').setup({
				direction_methods = { 'pattern' }
			})
		end
	},
	{
		'Exafunction/codeium.vim',
	},
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		opts = {}
	}
}
