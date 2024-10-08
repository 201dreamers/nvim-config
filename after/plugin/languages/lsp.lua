local ok, lsp_zero = pcall(require, "lsp-zero")
if not ok then
    return
end

lsp_zero.on_attach(function(_, bufnr)
    -- --------
    -- Mappings
    -- --------
    -- see :help lsp-zero-keybindings to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    local map = vim.keymap.set

    map("n", "<leader>lgd", vim.lsp.buf.definition, { buffer = bufnr, desc = "definition" })
    map("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "declaration" })
    map("n", "<leader>lgi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "implementation" })
    map("n", "<leader>lgo", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "type definition" })
    map("n", "<leader>lgr", vim.lsp.buf.references, { buffer = bufnr, desc = "references" })

    map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "signature help" })
    map("v", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "signature help" })
    map("n", "<leader>lh", vim.lsp.buf.hover, { buffer = bufnr, desc = "hover" })
    map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "rename" })
    map({ "n", "x" }, "<leader>lF", function()
        vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = "lsp format" })
    map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "code action" })

    map("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "open diagnostic" })
    map("n", "<leader>lp", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "prev diagnostic" })
    map("n", "<leader>ln", vim.diagnostic.goto_next, { buffer = bufnr, desc = "next diagnostic" })
end)

lsp_zero.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- Configure servers that should be installed
mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "ruff_lsp",
        "marksman",
        "jsonls",
        "clangd",
        "bashls",
        "taplo",
        "yamlls",
        -- "gopls",
    },
    handlers = {
        lsp_zero.default_setup,
        -- To exclude a language server from the automatic setup
        -- tsserver = lsp_zero.noop,

        lua_ls = require("core.languages.servers.lua_ls"),
        ruff_lsp = require("core.languages.servers.ruff"),
        pylsp = require("core.languages.servers.pylsp"),
        robotframework_ls = require("core.languages.servers.robotframework_ls"),
        -- pyright = require("core.languages.servers.pyright"),
        -- gopls = require("core.languages.servers.gopls"),
    },
})

-- Configure linters/formatters/debuggers that should be installed
mason_tool_installer.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "debugpy",
        -- "ruff",
        -- "golangci-lint",
    },
})
