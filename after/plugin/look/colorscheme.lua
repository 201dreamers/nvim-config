-- kanagawa-wave
-- aurora
-- darcula-solid
-- catpuccin-mocha

local ok, catppuccin = pcall(require, "catppuccin")

if ok then
	catppuccin.setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = true, -- disables setting the background color.
		show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
		no_bold = true, -- Force no bold
	})

	-- setup must be called before loading
	vim.cmd.colorscheme("catppuccin")
end
