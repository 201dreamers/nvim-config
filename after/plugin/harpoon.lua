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

for i = 1, 4 do
	local key = string.format("<M-%d>", i)
	local description = string.format("harpoon goto file %d", i)
	local action = function()
		harpoon_ui.nav_file(i)
	end

	map("n", key, action, { desc = description })
end
