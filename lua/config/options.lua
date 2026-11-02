vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10

-- whitespaces
vim.opt.listchars = {
	tab = "| ",
	trail = '·'
}
vim.opt.list = true

-- lsp
vim.g.python_recommended_style = 1
vim.g.zig_recommended_style = 1
vim.g.lua_recommended_style = 1
vim.g.go_recommended_style = 1
