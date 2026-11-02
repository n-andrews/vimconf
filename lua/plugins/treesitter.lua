return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local cfg = require("nvim-treesitter")
		cfg.install { "lua", "python", "zig", "go" }
		cfg.setup({
			highlight = { enable = true },
			sync_install = true,
			indent = { enable = true },
			autotage = { enable = true },
			ensure_installed = {"lua", "python", "zig", "go"},
		})
	end
}
