return {
	{
		'nvim-tree/nvim-web-devicons',
		opts = {}
	},
	{
		'onsails/lspkind.nvim',
	},
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		}
	},
	{
		'ecthelionvi/NeoColumn.nvim',
		opts = {
			always_on = true,
			NeoColumn = '100'
		}
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			show_current_context = true,
			show_current_context_start = true
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' }
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', {
					'diff',
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed
							}
						end
					end
				} },
				lualine_c = { 'filename', 'diagnostics' },
				lualine_x = { 'buffers' },
				lualine_y = { 'encoding', 'filetype' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
		}
	},
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		opts = {
			open_mapping = [[<C-Space>]],
			terminal_mappings = true,
			insert_mappings = true
		}
	},
}
