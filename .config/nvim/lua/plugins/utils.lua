return {
	{
		'kevinhwang91/nvim-ufo',
		event = 'BufRead',
		dependencies = {
			'kevinhwang91/promise-async',
			{
				'anuvyklack/fold-preview.nvim',
				dependencies = { 'anuvyklack/keymap-amend.nvim' },
				opts = {}
			},
		},
		config = function()
			vim.o.foldlevel = 99
			vim.o.foldenable = true
			require('ufo').setup {
				provider_selector = function ()
					return { 'treesitter', 'indent' }
				end
			}
		end
	},
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {}
	},
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function() require("flash").jump() end,
				desc =
				"Flash"
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc =
				"Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
		},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			show_current_context = true,
			show_current_context_start = true,
		}
	},
	{
		'chentoast/marks.nvim',
		opts = {}
	},
	{
		'echasnovski/mini.move',
		opts = {}
	},
	{
		'echasnovski/mini.pairs',
		opts = {}
	},
	{
		'echasnovski/mini.splitjoin',
		opts = {}
	},
	{
		'echasnovski/mini.sessions',
		opts = {}
	},
	{
		'echasnovski/mini.starter',
		opts = {}
	},
	{
		'echasnovski/mini.surround',
		opts = {}
	},
	{
		'echasnovski/mini.comment',
		opts = {}
	},
}
