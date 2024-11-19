local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    return
end

-- -----
-- Setup
-- -----
nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { ".git", "venv", ".venv" },
    },
    view = {
        side = "right",
    },
    renderer = {
        add_trailing = true,
        highlight_opened_files = "all",
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
        git_clean = false,
    },
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set
local tree_api = require("nvim-tree.api")

map("n", "<leader>e", tree_api.tree.toggle, { desc = "tree" })
