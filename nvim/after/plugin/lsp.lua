-- Mason setup
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "jsonls",
        "ts_ls",
        "cssls",
        "html",
        "texlab",
        "matlab_ls",
    },
})

-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Lua
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
        },
    },
})

-- Python
vim.lsp.config("pyright", { on_attach = on_attach, capabilities = capabilities })

-- Bash
vim.lsp.config("bashls", { on_attach = on_attach, capabilities = capabilities })

-- JSON
vim.lsp.config("jsonls", { on_attach = on_attach, capabilities = capabilities })

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })

-- CSS
vim.lsp.config("cssls", { on_attach = on_attach, capabilities = capabilities })

-- HTML
vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities })

-- TeX
vim.lsp.config("texlab", { on_attach = on_attach, capabilities = capabilities })

-- Matlab
vim.lsp.config("matlab_ls", { on_attach = on_attach, capabilities = capabilities })

