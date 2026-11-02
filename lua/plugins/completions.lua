return {
	{
		-- git plugin
		"tpope/vim-fugitive",
	},
	{
		-- autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cfg = require('cmp')
			cfg.setup({
				mapping = cfg.mapping.preset.insert({
					['<C-space>'] = cfg.mapping.complete(),
					['<Tab>'] = cfg.mapping.confirm({ select = true }),
					['<CR>'] = cfg.mapping.confirm({ select = true }),
				}),
				sources = cfg.config.sources({
					-- { name = 'buffer' },
					{ name = 'nvim_lsp' },
				})
			})

			cfg.setup.cmdline({'/', '?'}, {
				mapping = cfg.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cfg.setup.cmdline(':', {
				mapping = cfg.mapping.preset.cmdline(),
				sources = {
					{ name = 'path' },
					{ name = 'cmdline', options = { ignore_cmds = {'Man', '!'}}},
				},
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	}
}
