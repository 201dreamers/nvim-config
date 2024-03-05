local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

-- local telescope_themes = require("telescope.themes")
local telescope_actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

-- -----
-- Setup
-- -----
telescope.setup({
	defaults = {
		-- defaults = vim.tbl_extend(
		-- 	"force",
		-- 	telescope_themes.get_ivy(), -- or get_cursor, get_ivy
		-- 	{
		wrap_results = true,
		scroll_strategy = "limit",
		file_ignore_patterns = { ".git", "venv", "__pycache__", ".vscode", ".idea", "reports", "json-schema" },
		layout_config = {
			horizontal = {
				width = 0.99,
			},
			center = {
				width = 0.99,
			},
			vertical = {
				width = 0.99,
			},
			bottom_pane = {
				height = 35,
			},
		},
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				["<C-h>"] = "which_key",
			},
		},
		-- 	}
		-- ),
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		buffers = {
			mappings = {
				i = {
					["<C-d>"] = telescope_actions.delete_buffer,
				},
				n = {
					c = telescope_actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			-- hijack_netrw = true,
			theme = "ivy",
			follow = true,
			hidden = true,
			no_ignore = true,
		},
		live_grep_args = {
			auto_quoting = true,
			additional_args = { "-.LS" },
			mappings = {
				i = {
					["<C-f>"] = lga_actions.quote_prompt({ postfix = " -.LS " }),
					["<C-t>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " -v --glob *.{html,md} " }),
				},
			},
			-- also accepts theme settings, for example:
			-- theme = "dropdown", -- use dropdown theme
			-- layout_config = { mirror=true }, -- mirror preview pane
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		["ui-select"] = {
			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
telescope.load_extension("fzf")

-- --------
-- Mappings
-- --------
local map = vim.keymap.set
local telescope_builtin = require("telescope.builtin")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

map("n", "<leader><leader>", telescope_builtin.resume, { desc = "last search" })
map("n", "<leader>b", telescope_builtin.buffers, { desc = "buffers" })
map("n", "<leader>sf", telescope_builtin.find_files, { desc = "all files" })
map("n", "<leader>sg", telescope_builtin.git_files, { desc = "git files" })
map("n", "<leader>sh", telescope_builtin.help_tags, { desc = "help" })
map("n", "<leader>f", telescope.extensions.file_browser.file_browser, { desc = "file browser" })
map("n", "<leader>st", telescope.extensions.live_grep_args.live_grep_args, { desc = "grep" })
map("v", "<leader>st", live_grep_args_shortcuts.grep_visual_selection, { desc = "grep" })
