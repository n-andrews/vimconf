vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("i", '"', '""<Left>', { noremap = true, silent = true })
vim.keymap.set("i", '{', '{}<Left>', { noremap = true, silent = true })
vim.keymap.set("i", '[', '[]<Left>', { noremap = true, silent = true })
vim.keymap.set("i", '(', '()<Left>', { noremap = true, silent = true })

vim.keymap.set("v", '<leader>g"', 'c\"<C-R>"\"<Esc>', { noremap = true, silent = true })
vim.keymap.set("x", '<leader>g{', function () if vim.fn.mode() == "V" then return 'c{<CR><C-R>"}<Esc>v%=<Esc><Down>' else return 'c{<C-R>"}<Esc>' end end, { expr = true })
vim.keymap.set("x", '<leader>g[', function () if vim.fn.mode() == "V" then return 'c[<CR><C-R>"]<Esc>v%=<Esc><Down>' else return 'c[<C-R>"]<Esc>' end end, { expr = true })
vim.keymap.set("x", '<leader>g(', function () if vim.fn.mode() == "V" then return 'c(<CR><C-R>")<Esc>v%=<Esc><Down>' else return 'c(<C-R>")<Esc>' end end, { expr = true })
