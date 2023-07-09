return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'JoosepAlviste/nvim-ts-context-commentstring'
	},
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			auto_install = true,

			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
			context_commentstring = {
				enable = true
			},
			autotag = {
				enable = true
			}
		})
	end
}
