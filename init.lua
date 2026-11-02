vim.g.have_nerd_font = true

require("config.keybinds")
require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd('FileType', {
	pattern = { '<filetype>' },
	callback = function() vim.treesitter.start() end,
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({async = true})
    end,
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = "*.py",
    callback = function()
        -- Save the cursor position to avoid jumping
        local view = vim.fn.winsaveview()

        -- %!black filters the whole file through black and reads it back into the buffer
        -- silent! hides standard output and avoids errors if black isn't installed
        vim.cmd("silent! %!black -q -")

        -- Restore cursor position
        vim.fn.winrestview(view)
        -- vim.cmd("!black " .. vim.fn.expand("%"))
    end,
})

require("config.lsp")
