if not pcall(vim.cmd.UndotreeHide) then
    return
end

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo tree" })
