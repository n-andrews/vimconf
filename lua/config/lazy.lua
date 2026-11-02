-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	change_detection = { notify = false},
	checker = { enabled = true },
})

-- lualine """theme setup"""
-- these are the nightfly colors. No names because it sucks.
local colors = {
	color3   = '#2c3043',
	color6   = '#a1aab8',
	color7   = '#82aaff',
	color8   = '#ae81ff',
	color0   = '#092236',
	color1   = '#ff5874',
	color2   = '#c3ccdc',
}

local c_nf = require("lualine.themes.nightfly")
-- TODO: modify the x,y zones be independend of b & c
-- remove the encoding (and the penguin?)
c_nf.normal.c.fg = colors.color7
c_nf.insert.c = { fg = colors.color2, bg = colors.color3 }
c_nf.replace.c = { fg = colors.color1, bg = colors.color3 }
c_nf.visual.c = { fg = colors.color8, bg = colors.color3 }

require("lualine").setup({
	options = {
		theme = function() return c_nf end,
	}
})
