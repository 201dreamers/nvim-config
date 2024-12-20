local ok, oil = pcall(require, "oil")
if not ok then
    return
end

-- -----
-- Setup
-- -----
oil.setup({
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
    default_file_explorer = true,

    -- Id is automatically added at the beginning, and name at the end
    -- See :help oil-columns
    columns = {
        "icon",
        "size",
    },

    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,

    -- Set to true to watch the filesystem for changes and reload oil
    watch_for_changes = false,

    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,

        -- Sort file names with numbers in a more intuitive order for humans.
        -- Can be "fast", true, or false. "fast" will turn it off for large directories.
        natural_order = "fast",

        -- Sort file and directory names case insensitive
        case_insensitive = false,

        is_always_hidden = function(name, _)
            return name == ".."
        end
    },
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set
local oil_actions = require("oil.actions")

map("n", "-", oil.open, { desc = "fb buffer" })
map("n", "<leader>-", oil_actions.open_cwd.callback, { desc = "fb cwd" })

-- Save path to the file to clipboard
map("n", "<leader>oy", function()
    local original_register_content = vim.fn.getreg(vim.v.register)
    oil_actions.yank_entry.callback()
    vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
    vim.fn.setreg(vim.v.register, original_register_content)
end, { desc = "copy clipboard" })
map("n", "<leader>oc", oil_actions.open_cmdline.callback, { desc = "open path in cmdline" })
map("n", "<leader>ot", oil_actions.open_terminal.callback, { desc = "open path in terminal" })
