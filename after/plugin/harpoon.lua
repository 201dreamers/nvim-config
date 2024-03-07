local ok, harpoon = pcall(require, "harpoon")
if not ok then
	return
end

-- -----
-- Setup
-- -----
harpoon.setup({
	tabline = true,
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

map("n", "<leader>a", harpoon_mark.add_file, { desc = "harpoon add" })
map("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "harpoon quick menu" })
map("n", "H", harpoon_ui.nav_prev, { desc = "harpoon go prev" })
map("n", "L", harpoon_ui.nav_next, { desc = "harpoon go next" })

for i, key in ipairs({ "q", "w", "e", "r", "t" }) do
	local combo = string.format("<M-%s>", key)
	local description = string.format("harpoon goto file %d", i)
	local action = function()
		harpoon_ui.nav_file(i)
	end

	map("n", combo, action, { desc = description })
end
