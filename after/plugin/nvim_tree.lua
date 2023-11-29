require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
        git_clean = false,
    },
})
