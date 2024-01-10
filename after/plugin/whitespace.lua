local ok, whitespace = pcall(require, "whitespace-nvim")

if not ok then
    return
end

-- -----
-- Setup
-- -----
whitespace.setup({
    -- `highlight` configures which highlight is used to display
    -- trailing whitespace
    highlight = 'DiffDelete',

    -- `ignored_filetypes` configures which filetypes to ignore when
    -- displaying trailing whitespace
    ignored_filetypes = {
        "toggleterm", "TelescopePrompt", "diff", "git", "gitcommit",
        "unite", "qf", "help", "markdown", "fugitive", "Trouble"
    },

    ignore_terminal = true,
})


-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map('n', '<Leader>tw', require('whitespace-nvim').trim, { desc = "trim whitespaces" })
