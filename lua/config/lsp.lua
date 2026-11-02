-- AUTOCOMPLETION
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- DEFINITIONS: lua
vim.lsp.config["lua_ls"] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc'}, '.git'},
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			}
		}
	}
}

-- DEFINITIONS: zig
vim.lsp.config["zls"] = {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zig.zon' },
    root_markers = { { 'build.zig', 'build.zig.zon'}, '.git'},
    single_file_support = true,
    capabilities = capabilities,
    settings = {},
}

-- DEFINITIONS: go
vim.lsp.config["gopls"] = {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = {{"go.mod"}, ".git"},
    single_file_support = true,
    capabilities = capabilities
}

-- DEFINITIONS: python
vim.lsp.config["python"] = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { ".git", "pyrightconfig.json", "main.py" },
    single_file_support = true,
    capabilities = capabilities,
    settings = {
        {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "off",
                    diagnosticSeverityOverrides = {
                        reportAny = "none",
                        reportUnknownMemberType = "none",
                        reportUnknownArgumentType = "none",
                        reportUnknownVariableType = "none",
                    }
                },
                disableTaggedHints = true,
            }
        }
    }
}

-- DIAGNOSTICS (language server errs)
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false, -- This is too fast for me imho
    severity_sort = true,
    float = {
        border = "rounded",
        source = true
    }
})

-- commands & stuff
vim.api.nvim_create_autocmd("LspAttach", {
    -- not sure what this does
    group = vim.api.nvim_create_augroup("my.lsp", {clear = true}),
    callback = function (args)
        local opts = { buffer = args.buf }
        local client = vim.lsp.get_client_by_id(args.data_client_id)
        if not client then return end

        -- COMMANDS 
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
        vim.keymap.set({"n", "x"}, "<F3>", function() vim.lsp.buf.format({ async = true}) end) -- Go to reformat entire file
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border = "rounded", max_height = 25, max_width = 100}) end, opts) -- Hovering
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts) -- Replace symbol

        if client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("LspDocumentHighlight" .. args.buf, { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI"}, {
                buffer = args.buf,
                group = group,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = args.buf,
                group = group,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- ENABLE
vim.lsp.enable({"lua_ls", "zls", "gopls", "python"})
