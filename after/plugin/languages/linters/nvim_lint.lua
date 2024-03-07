local ok, lint = pcall(require, "lint")
if not ok then
    return
end

-- -----
-- Setup
-- -----
lint.linters_by_ft = {
    python = { "ruff" },
    go = { "golangci-lint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>ll", lint.try_lint, { desc = "lint" })
