local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local opts = lsp_zero.nvim_lua_ls({
    settings = {
        Lua = {
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            -- format = {
            --     enable = true,
            --     defaultConfig = {
            --         indent_style = "space",
            --         indent_size = "4",
            --     },
            -- },
        },
    },
})

return function()
    lspconfig.lua_ls.setup(opts)
end
