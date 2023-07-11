--| Keymaps |--

-- Allow Space as Leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Easily traverse windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Easily traverse buffers
vim.keymap.set('n', '<A-l>', ':bnext<cr>', { silent = true, desc = 'Goto next buffer' })
vim.keymap.set('n', '<A-h>', ':bprevious<cr>', { silent = true, desc = 'Goto previous buffer' })

--| ToggleTerm |--

local Terminal = require('toggleterm.terminal').Terminal

-- LazyGit
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
function _LazyGitToggle()
	lazygit:toggle()
end

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Navigate out of terminal
vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<cr>', { silent = true })

-- Close terminal
vim.keymap.set('t', '<C-d>', '<cmd>bdelete!<cr>', { silent = true })

--| Telescope |--

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require('telescope.actions')
local file_browser = telescope.extensions.file_browser

telescope.setup {
	extensions = {
		fzf = {},
		file_browser = {
			hijack_netrw = true,
			grouped = true,
			initial_mode = 'normal',
			-- respect_gitignore = false,
			depth = 3,
			mappings = {
				n = {
					['l'] = telescope_actions.select_default,
					['h'] = file_browser.actions.goto_parent_dir,
					['H'] = file_browser.actions.toggle_hidden,
				}
			}
		},
	}
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('projects')

--| LSP |--

local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local lsp = lsp_zero.preset({})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
end)

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.setup()

--| Completion |--

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local lspkind = require('lspkind')

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			ellipsis_char = '...',
		})
	},
	mapping = {
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback()
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer',  keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2 },
	}
})

--| Which-Key |--

local whichkey = require('which-key')

whichkey.register({
	d = {
		name = '[d]elete',
		b = { ':bdelete<cr>', '[b]uffer' },
	},
	s = {
		name = '[s]earch',
		b = { telescope_builtin.buffers, '[b]uffers' },
		d = { telescope_builtin.diagnostics, '[d]iagnostics' },
		f = { ':Telescope file_browser<cr>', '[f]iles' },
		g = { telescope_builtin.git_files, '[g]it files' },
		h = { telescope_builtin.help_tags, '[h]elp' },
		r = { telescope_builtin.live_grep, '[r]egex' },
		s = { ':Telescope file_browser path=%:p:h select_buffer=true<cr>', '[s]earch from here' },
		t = { ':TodoTelescope<cr>', '[t]odos' }
	},
	g = {
		name = '[g]it',
		g = { ':lua _LazyGitToggle()<cr>', 'Open [g]it' },
	},
	i = { ':lua vim.lsp.buf.hover()<cr>', '[i]nspect' },
	l = {
		name = '[l]sp',
		a = { ':lua vim.lsp.buf.code_action()<cr>', '[a]ction' },
		d = { ':lua vim.lsp.buf.definition()<cr>', '[d]efinition' },
		D = { ':lua vim.lsp.buf.declaration()<cr>', '[D]eclaration' },
		i = { ':lua vim.lsp.buf.implementation()<cr>', '[i]mplementation' },
		r = { ':lua vim.lsp.buf.rename()<cr>', '[r]ename' },
		R = { ':lua vim.lsp.buf.references()<cr>', '[R]eferences' },
		s = { ':lua vim.lsp.buf.signature_help()<cr>', '[s]ignature help' },
		t = { ':lua vim.lsp.buf.type_definition()<cr>', '[t]ype definition' },
	},
	m = {
		name = '[m]arks',
		m = { ':Telescope marks<cr>', '[m]arks' }
	},
	p = {
		name = '[p]rojects',
		p = { ':Telescope projects<cr>', 'explore [p]rojects' }
	},
	t = {
		name = '[t]asks',
		r = { ':OverseerRun<cr>', '[r]un' },
		t = { ':OverseerToggle<cr>', '[t]oggle' }
	}
}, { prefix = '<leader>' })
