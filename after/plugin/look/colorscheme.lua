-- ---------
-- Favorite:
-- ---------
-- kanagawa-wave
-- kanagawa-dragon
-- aurora
-- darcula-solid
-- catpuccin-mocha

-- ------
-- General
-- ------
local function set_colorscheme(plugin_name, theme_name, opts)
    local ok, plugin = pcall(require, plugin_name)

    if not ok then
        return
    end

    plugin.setup(opts)
    vim.cmd.colorscheme(theme_name)
end

-- ---------------------
-- Themes configurations
-- ---------------------
local catpuccin_opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    no_bold = true, -- Force no bold
}

local kanagawa_opts = {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = true, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    theme = "dragon", -- Load "wave" theme when 'background' option is not set
}

-- ---------------
-- Set colorscheme
-- ---------------
-- set_colorscheme("catpuccin", "catpuccin", catpuccin_opts)
set_colorscheme("kanagawa", "kanagawa-dragon", kanagawa_opts)
