local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
    defaults = {
        wrap_results = true,
        scroll_strategy = "limit",
        file_ignore_patterns = { ".git", "venv", "__pycache__", ".vscode", ".idea", "reports", "json-schema" },
        layout_config = {
            horizontal = {
                width = 0.99,
            },
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
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
                    ["<C-f>"] = lga_actions.quote_prompt({ postfix = " -.LS "}),
                    ["<C-t>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " -v --iglob *.{html,md} " }),
                },
            },
            -- also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- layout_config = { mirror=true }, -- mirror preview pane
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
        }
    }
})

telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
