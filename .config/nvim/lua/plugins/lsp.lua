return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'dev-v3',
		lazy = true,
		config = false,
	},
	{
		'williamboman/mason.nvim',
		cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
		lazy = true,
		config = true,
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'onsails/lspkind.nvim'
		},
		config = function ()
			require('lsp-zero').extend_cmp()
			local cmp_action = require('lsp-zero').cmp_action()
			local cmp = require('cmp')

			cmp.setup {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				formatting = {
					fields = { 'abbr', 'kind', 'menu' },
					format = require('lspkind').cmp_format {
						mode = 'symbol',
						maxwidth = 50,
						ellipsis_char = '...'
					}
				},
				mapping = {
					['<Tab>'] = cmp_action.luasnip_supertab(),
					['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
				}
			}
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'nvim-lua/plenary.nvim',
			'pmizio/typescript-tools.nvim',
			'lukas-reineke/lsp-format.nvim'
		},
		config = function ()
			local lsp = require('lsp-zero').preset {}
			local function on_attach (client, bufnr)
				lsp.default_keymaps { buffer = bufnr }

				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint(bufnr, true)
				end

				if client.supports_method('textDocument/formatting') then
					require('lsp-format').on_attach(client)
				end

				if client.server_capabilities.documentSymbolProvider then
					require('nvim-navic').attach(client, bufnr)
				end
			end
			lsp.on_attach(on_attach)

			require('typescript-tools').setup {
				on_attach = on_attach,
				settings = {
					tsserver_file_preferences = {
						includeInlayParameterNameHints = 'all',
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayVariableTypeHints = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				}
			}

			require('mason-lspconfig').setup {
				ensure_installed = { 'lua_ls' },
				handlers = {
					lsp.default_setup,
					lua_ls = function ()
						require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
					end
				}
			}

			vim.diagnostic.config { underline = true }
		end
	},
}
