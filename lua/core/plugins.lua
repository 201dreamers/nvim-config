return {
    -- --------------------
    -- Basic usage and look
    -- --------------------
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    { "mbbill/undotree" },
    { "ThePrimeagen/harpoon" },
    { "nvim-pack/nvim-spectre" },


    -- ---------
    -- Telescope
    -- ---------
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },

    -- -----------------------------
    -- General stuff for programming
    -- -----------------------------
    {
        "numToStr/Comment.nvim",
        config = {},
        lazy = false,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
        },
    },
    { "nvim-treesitter/nvim-treesitter" },
    { "nmac427/guess-indent.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "folke/lsp-colors.nvim", event = "BufRead" },
    -- { "mfussenegger/nvim-lint" },
    { "mhartington/formatter.nvim" },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},        -- Required
            {'hrsh7th/cmp-nvim-lsp'},    -- Required
            {'L3MON4D3/LuaSnip'},        -- Required
            { "hrsh7th/cmp-buffer" },    -- Optional
            { "onsails/lspkind.nvim" },  -- Optional
        }
    },


    -- ------------------------------
    -- Related to a specific language
    -- ------------------------------
    -- Robot Framework
    { "totu/robotframework-vim",                  event = "BufEnter *.robot,*.resource" },
    { "evedovelli/rst-robotframework-syntax-vim", event = "BufEnter *.robot,*.resource" },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},

    -- Python
    { "Vimjas/vim-python-pep8-indent" },

    -- ---
    -- Git
    -- ---
    { "sindrets/diffview.nvim" },
    { "lewis6991/gitsigns.nvim" },
    {
     "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },

    -- ------
    -- Others
    -- ------
    {  -- fast movement around text
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end
    },
    {
        "ntpeters/vim-better-whitespace",
        config = function()
            vim.g.better_whitespace_filetypes_blacklist = {
                "toggleterm", "TelescopePrompt", "diff", "git", "gitcommit",
                "unite", "qf", "help", "markdown", "fugitive"
            }
        end
    },

    -- ------------
    -- Colorschemes
    -- ------------
    { "lunarvim/colorschemes" },
    { "christianchiarulli/nvcode-color-schemes.vim" },
    { "Mofiqul/vscode.nvim" },
    { "sainnhe/edge" },
    { "rebelot/kanagawa.nvim" },
    { "EdenEast/nightfox.nvim" },
    {
        "briones-gabriel/darcula-solid.nvim",
        dependencies = { "rktjmp/lush.nvim" }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
}
