-- Yank highlighting
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
	end,
})

-- Autosave
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
	pattern = '*.*',
	callback = function()
		vim.api.nvim_command('silent update')
	end
})
