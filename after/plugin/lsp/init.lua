local lsp_zero = require("lsp-zero")
local lsp = lsp_zero.preset({})
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")


lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr, desc = "definition" })
    vim.keymap.set("n", "<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr, desc = "declaration" })
    vim.keymap.set("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = bufnr, desc = "implementation" })
    vim.keymap.set("n", "<leader>lgo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = bufnr, desc = "type definition" })
    vim.keymap.set("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = bufnr, desc = "references" })

    vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, desc = "signature help" })
    vim.keymap.set("v", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, desc = "signature help" })
    vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr, desc = "hover" })
    vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, desc = "rename" })
    vim.keymap.set({"n", "x"}, "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { buffer = bufnr, desc = "format" })
    vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr, desc = "code action" })

    vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr, desc = "open diagnostic" })
    vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = bufnr, desc = "prev diagnostic" })
    vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = bufnr, desc = "next diagnostic" })
end)

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "marksman",
        "pylsp",
        "jsonls",
        "clangd",
        "bashls",
        "taplo",
        "yamlls"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
