return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'nvim-treesitter/nvim-treesitter-context',
			'windwp/nvim-ts-autotag',
		},
		config = function()
			local configs = require('nvim-treesitter.configs')

			configs.setup {
				auto_install = true,

				highlight = { enable = true },
				indent = { enable = true },

				context_commentstring = { enable = true },
				autotag = { enable = true }
			}

			require('treesitter-context').setup {}
		end
	},

}
