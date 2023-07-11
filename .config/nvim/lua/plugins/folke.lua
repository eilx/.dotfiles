return {
	{
		'folke/neodev.nvim',
		opts = {}
	},
	{
		'folke/todo-comments.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = {}
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			icons = {
				group = ''
			},
			window = {
				border = 'single',
			}
		},
	},
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							mode = function(str)
								return "\\<" .. str
							end
						}
					})
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			{ 'rcarriga/nvim-notify', opts = { background_colour = '#000000' } },
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		}
	}
}
