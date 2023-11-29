-- --------
-- Requires
-- --------
local git_signs = require("gitsigns")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")
local tree_api = require("nvim-tree.api")
local wk = require("which-key")
local spectre = require("spectre")

-- -------------------
-- Which-key registers
-- -------------------

wk.register({
    ["<leader>s"] = { name = "+find" },
    ["<leader>d"] = { name = "+diagnostic" },
    ["<leader>g"] = { name = "+git" },
    ["<leader>l"] = {
        name = "+lsp",
        g = { name = "+goto" },
    },
    ["<leader>lg"] = { name = "+goto" },
})


-- ----------------
-- General mappings
-- ----------------

-- Moving around windows
vim.keymap.set("n", "<C-h>", "<C-w><Left>")
vim.keymap.set("n", "<C-j>", "<C-w><Down>")
vim.keymap.set("n", "<C-k>", "<C-w><Up>")
vim.keymap.set("n", "<C-l>", "<C-w><Right>")

vim.keymap.set("n", "<C-Left>", ":vertical resize -5<cr>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +5<cr>")
vim.keymap.set("n", "<C-Up>", ":resize +5<cr>")
vim.keymap.set("n", "<C-Down>", ":resize -5<cr>")

-- Buffers
vim.keymap.set("n", "H", ":bp<cr>")
vim.keymap.set("n", "L", ":bn<cr>")
vim.keymap.set("n", "<leader>c", ":bn<cr>:bd#<cr>", { desc = "close buffer" })

-- General better movement
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv")

-- Copy / paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete to void" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "line to clipboard" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste over" })

vim.keymap.set("n", "<leader>t", ":StripWhitespace<cr>", { desc = "remove trailing spaces" })
-- vim.keymap.set("n", "<leader>t", [[:%s/\s\+$//e<cr>]], { desc = "remove trailing spaces" })

-- ---------------
-- Plugin mappings
-- ---------------

-- Neo Tree
vim.keymap.set("n", "<leader>e", tree_api.tree.toggle, { desc = "tree" })

-- Undootree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo tree" })

-- Harpoon
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "harpoon add" })
vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "harpoon quick menu" })

vim.keymap.set("n", "<M-1>", function() harpoon_ui.nav_file(1) end, { desc = "harpoon goto file 1" })
vim.keymap.set("n", "<M-2>", function() harpoon_ui.nav_file(2) end, { desc = "harpoon goto file 2" })
vim.keymap.set("n", "<M-3>", function() harpoon_ui.nav_file(3) end, { desc = "harpoon goto file 3" })
vim.keymap.set("n", "<M-4>", function() harpoon_ui.nav_file(4) end, { desc = "harpoon goto file 4" })

-- Telescope
vim.keymap.set("n", "<leader><leader>", telescope_builtin.resume, { desc = "last search" })
vim.keymap.set("n", "<leader>sb", telescope_builtin.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<leader>st", telescope.extensions.live_grep_args.live_grep_args, { desc = "grep" })
vim.keymap.set("v", "<leader>st", live_grep_args_shortcuts.grep_visual_selection, { desc = "grep" })
vim.keymap.set("n", "<leader>sg", telescope_builtin.git_files, { desc = "git files" })
vim.keymap.set("n", "<leader>sf", function()
    telescope_builtin.find_files({ follow = true, hidden = true, no_ignore = true })
end, { desc = "all files" })

-- Git
vim.keymap.set("n", "<leader>gb", git_signs.toggle_current_line_blame, { desc = "blame" })
vim.keymap.set("n", "<leader>gd", git_signs.diffthis, { desc = "diff" })

-- Spectre
vim.keymap.set("n", "<leader>ss", spectre.toggle, { desc = "toggle spectre" })
vim.keymap.set("n", "<leader>sw", function() spectre.open_visual({ select_word = true }) end, {
    desc = "spectre current word"
})
vim.keymap.set("v", "<leader>sw", function()
    vim.cmd.stopinsert(); spectre.open_visual()
end, {
    desc = "spectre current word"
})
vim.keymap.set("n", "<leader>sp", function() spectre.open_file_search({ select_word = true }) end, {
    desc = "spectre on current file"
})
