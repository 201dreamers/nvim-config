local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
    return
end

-- -----
-- Setup
-- -----
gitsigns.setup()


-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "blame" })
map("n", "<leader>gd", gitsigns.diffthis, { desc = "diff" })
