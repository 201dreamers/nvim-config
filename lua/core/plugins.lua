return {
	-- --------------------
	-- Basic usage and look
	-- --------------------
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
	{ "mg979/vim-visual-multi" },
	{ "dhruvasagar/vim-table-mode" },
	{ "szw/vim-maximizer" },

	-- ---------
	-- Telescope
	-- ---------
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- -----------------------------
	-- General stuff for programming
	-- -----------------------------
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>/",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<leader>/",
				---Block-comment keymap
				block = "gb",
			},
		},
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

	-- Languages support
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "onsails/lspkind.nvim" }, -- Optional
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
	},
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = "mfussenegger/nvim-dap" },
	{ "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" } },

	-- ------------------------------
	-- Related to a specific language
	-- ------------------------------
	-- Robot Framework
	{ "totu/robotframework-vim", event = "BufEnter *.robot,*.resource" },
	{ "evedovelli/rst-robotframework-syntax-vim", event = "BufEnter *.robot,*.resource" },

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

	-- Python
	{ "Vimjas/vim-python-pep8-indent" },

	-- Org mode
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
	},
	{ "akinsho/org-bullets.nvim", event = "VeryLazy" },
	-- { "michaelb/sniprun",         event = "VeryLazy" },

	-- ---
	-- Git
	-- ---
	{ "sindrets/diffview.nvim", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
		event = "VeryLazy",
	},

	-- ------
	-- Others
	-- ------
	{ -- fast movement around text
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{ "johnfrankmorgan/whitespace.nvim" },
	-- {
	--     "ntpeters/vim-better-whitespace",
	--     config = function()
	--         vim.g.better_whitespace_filetypes_blacklist = {
	--             "toggleterm", "TelescopePrompt", "diff", "git", "gitcommit",
	--             "unite", "qf", "help", "markdown", "fugitive"
	--         }
	--     end
	-- },

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
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
}
