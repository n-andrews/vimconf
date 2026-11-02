vim.api.nvim_set_hl(0, "Normal", {bg = "None"})
vim.cmd.colorscheme "habamax"

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			opts = {}
		},
		opts = {
			options = {
				-- Note that I do customize this lualine theme in the lazy loader. 
				theme = 'nightfly', 
				component_separators = { left = '', right = ''},
			}
		}
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end
	}
}

