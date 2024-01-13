local g = vim.g

g.maximizer_set_mapping_with_bang = 0
g.maximizer_default_mapping_key = ""
g.maximizer_set_default_mapping = 0

vim.g = g

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>m", ":MaximizerToggle<cr>", { desc = "maximize" })
