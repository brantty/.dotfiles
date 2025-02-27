-------------------------------------------------------------------------------
-- Plugin manager configuration file
-------------------------------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md

-- Boostrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Start setup
lazy.setup({
	-- add LazyVim and import its plugins
	-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- { import = "lazyvim.plugins.extras.vscode" },
	-- import/overrides with your plugin
	-- Colorscheme:
	-- The colorscheme should be available when starting Neovim.
	{
		"navarasu/onedark.nvim",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- priority = 1000, -- make sure load this before all the other start plugins
	},

	-- other colorschemes:
	{
		"tanvirtin/monokai.nvim",
		-- lazy = true
	},
	{ "https://github.com/rose-pine/neovim", name = "rose-pine", layz = true },

	-- Icons
	{ "kyazdani42/nvim-web-devicons", lazy = true },

	-- Dashboard (start screen)
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdanirw/nvim-web-devicons" },
	},

	-- Git lables
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("gitsigns").setup({})
		end,
	},

	-- File explorer
	-- {
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	dependencies = { "kyazdani42/nvim-web-devicons" },
	-- },
	--
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},

	-- Statusline
	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Indent line
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Tag viewer
	{ "preservim/tagbar" },

	-- Autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsetEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
      "neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",

			-- For vsnip users
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",

			-- For luasnip users
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- For ultisnips users
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",

			-- for snippy users
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
	},

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "Burntsushi/ripgrep",
      "sharkdp/fd",
      "nvim-treesitter/nvim-treesitter",
    },
  },

	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
	},
})
