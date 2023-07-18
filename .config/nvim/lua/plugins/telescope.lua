return {
	'nvim-telescope/telescope-file-browser.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local telescope = require('telescope')
		telescope.setup {
			extensions = {
				fzf = {},
				file_browser = {
					hijack_netrw = true,
					initial_mode = 'normal',
					depth = 4
				}
			}
		}

		telescope.load_extension 'file_browser'
		telescope.load_extension 'fzf'
	end
}
