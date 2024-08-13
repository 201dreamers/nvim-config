local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local telescope_actions = require("telescope.actions")
local telescope_config = require("telescope.config")
local lga_actions = require("telescope-live-grep-args.actions")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--follow")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- -----
-- Setup
-- -----
telescope.setup({
    defaults = {
        path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s  %s", tail, path)
        end,
        scroll_strategy = "limit",
        vimgrep_arguments = vimgrep_arguments,
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                mirror = true,
                prompt_position = "top",
                width = 0.95,
                height = 0.95,
            },
        },
        mappings = {
            i = {
                ["<C-h>"] = "which_key", -- default <C-/>
            },
        },
        file_ignore_patterns = {
            ".git/",
            ".*venv.*/",
            "__pycache__/",
            ".vscode/",
            ".idea/",
            "json-schema/",
            "reports/",
            "ssd_compare/",
            "releases/",
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
        find_files = {
            previewer = true,
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
            sort_mru = true,
            mappings = {
                i = {
                    ["<C-x>"] = telescope_actions.delete_buffer,
                },
                n = {
                    c = telescope_actions.delete_buffer,
                },
            },
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            additional_args = function()
                return { "-.LS" }
            end,
            mappings = {
                i = {
                    ["<C-t>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = {},
    },
})

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
map("n", "<leader>f", telescope_builtin.find_files, { desc = "all files" })
map("n", "<leader>sg", telescope_builtin.git_files, { desc = "git files" })
map("n", "<leader>sh", telescope_builtin.help_tags, { desc = "help" })
map("n", "<leader>ss", telescope.extensions.live_grep_args.live_grep_args, { desc = "grep" })
map("v", "<leader>ss", live_grep_args_shortcuts.grep_visual_selection, { desc = "grep" })
