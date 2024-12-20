local ok, mini_files = pcall(require, "mini.files")
if not ok then
    return
end

-- -----
-- Setup
-- -----
mini_files.setup({
    mappings = {
        go_in = "",
        go_in_plus = "l",
    },

    -- General options
    options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = false,
    },
})

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

local minifiles_toggle = function()
    if not mini_files.close() then
        mini_files.open(vim.api.nvim_buf_get_name(0))
        mini_files.reveal_cwd()
    end
end

local yank_path = function()
    local path = (mini_files.get_fs_entry() or {}).path
    if path == nil then
        return vim.notify("Cursor is not on valid entry")
    end
    vim.fn.setreg("+", path)
end

map("n", "<leader>e", minifiles_toggle, { desc = "file browser" })
map("n", "<leader>ty", yank_path, { desc = "copy path to clipboard" })
