return {
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('tokyonight').setup {
				transparent = true,
				styles = {
					sidebars = 'transparent',
					floats = 'transparent',
				}
			}

			local hour = tonumber(os.date('%H', os.time()))
			if hour > 5 and hour < 20 then
				vim.cmd [[colorscheme tokyonight-day]]
			else
				vim.cmd [[colorscheme tokyonight-moon]]
			end
		end
	},
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify'
		},
		opts = {
			lsp = {
				override = {
					['cmp.entry.get_documentation'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				}
			},
			presets = {
				long_message_to_split = true,
				lsp_doc_border = true,
			}
		}
	},
}
