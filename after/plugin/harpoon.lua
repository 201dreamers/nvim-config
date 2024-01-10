local ok, harpoon = pcall(require, "harpoon")

if not ok then
    return
end

-- -----
-- Setup
-- -----
harpoon.setup({
    tabline = false,
})


-- --------
-- Mappings
-- --------
local map = vim.keymap.set
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

map("n", "<leader>a", harpoon_mark.add_file, { desc = "harpoon add" })
map("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "harpoon quick menu" })

map("n", "<M-1>", function() harpoon_ui.nav_file(1) end, { desc = "harpoon goto file 1" })
map("n", "<M-2>", function() harpoon_ui.nav_file(2) end, { desc = "harpoon goto file 2" })
map("n", "<M-3>", function() harpoon_ui.nav_file(3) end, { desc = "harpoon goto file 3" })
map("n", "<M-4>", function() harpoon_ui.nav_file(4) end, { desc = "harpoon goto file 4" })
