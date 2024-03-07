local ok, spectre = pcall(require, "spectre")
if not ok then
    return
end

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>st", spectre.toggle, { desc = "toggle spectre" })
map("n", "<leader>sw", function()
    spectre.open_visual({ select_word = true })
end, { desc = "spectre current word" })
map("v", "<leader>sw", function()
    vim.cmd.stopinsert()
    spectre.open_visual()
end, { desc = "spectre current word" })
map("n", "<leader>sp", function()
    spectre.open_file_search({ select_word = true })
end, { desc = "spectre on current file" })
