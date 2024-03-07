local ok, conform = pcall(require, "conform")
if not ok then
    return
end

-- -----
-- Setup
-- -----
conform.setup({
    formatters_by_ft = {
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "ruff_format" },
        -- python = { "isort", "black" },
    },
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = "format" })
