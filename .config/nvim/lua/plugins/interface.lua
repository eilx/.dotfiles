return {
	{
		'utilyre/barbecue.nvim',
		version = '*',
		dependencies = {
			'SmiteshP/nvim-navic',
			'nvim-tree/nvim-web-devicons'
		},
		opts = {
			attach_navic = false,
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			local lualine = require('lualine')
			lualine.setup {
				options = {
					component_separators = { left = '|', right = '|' },
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = { 'buffers' },
					lualine_b = {},
					lualine_c = {},
					lualine_x = { 'filetype' },
					lualine_y = { 'diagnostics',
						{
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
						},
					},
					lualine_z = {
						'branch'
					},
				}
			}
		end
	},
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		init = function()
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end,
		config = function()
			require('toggleterm').setup {
				open_mapping = [[<C-\>]]
			}
			local Terminal = require('toggleterm.terminal').Terminal

			local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', hidden = true }
			function _ToggleLazyGit()
				lazygit:toggle()
			end

			local floater = Terminal:new { direction = 'float', hidden = true }
			function _ToggleFloater()
				floater:toggle()
			end

			-- Keymaps
			vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua _ToggleFloater()<cr>', {
				noremap = true,
				silent = true,
				desc = 'Floating terminal'
			})

			vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _ToggleLazyGit()<cr>', {
				noremap = true,
				silent = true,
				desc = '[g]it browser'
			})
		end
	}
}
