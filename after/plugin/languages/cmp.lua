local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

-- local lspkind = require("lspkind")
local cmp_format = require("lsp-zero").cmp_format()

-- -----
-- Setup
-- -----
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
    },

    -- Make the first item in completion menu always be selected
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert",
    },

    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
    -- formatting = {
    --     fields = { "abbr", "kind", "menu" },
    --     format = lspkind.cmp_format({
    --         mode = "symbol",       -- show only symbol annotations
    --         maxwidth = 50,         -- prevent the popup from showing more than provided characters
    --         ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    --     })
    -- },

    -- Adding borders to completion menu
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- scroll up and down the documentation window
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
})
