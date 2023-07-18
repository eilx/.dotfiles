return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local whichkey = require('which-key')
		whichkey.setup {
			window = {
				border = 'single'
			}
		}

		local keymap = vim.api.nvim_set_keymap
		keymap('n', '<Tab>', '<cmd>bnext<cr>', { silent = true })
		keymap('n', '<S-Tab>', '<cmd>bprev<cr>', { silent = true })

		keymap('n', '<C-h>', '<C-w>h', {})
		keymap('n', '<C-j>', '<C-w>j', {})
		keymap('n', '<C-k>', '<C-w>k', {})
		keymap('n', '<C-l>', '<C-w>l', {})

		whichkey.register({
			s = { '<cmd>Telescope file_browser<cr>', '[s]earch files' },
			t = { '<cmd>TodoTelescope keywords=TODO,FIX<cr>', '[t]odos' }
		}, { prefix = '<leader>' })
	end
}
