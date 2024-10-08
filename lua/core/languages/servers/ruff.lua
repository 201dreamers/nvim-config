local lspconfig = require("lspconfig")

local opts = {
    trace = "messages",
    init_options = {
        settings = {
            logLevel = "debug",
        },
    },
}

return function()
    lspconfig.ruff_lsp.setup(opts)
end
