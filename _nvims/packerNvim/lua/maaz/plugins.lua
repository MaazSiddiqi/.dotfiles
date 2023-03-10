local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Lua Development
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim")
	use("christianchiarulli/lua-dev.nvim")
	use("ldelossa/litee.nvim")

	--Color Schemes
	use("shaunsingh/nord.nvim")
	-- use("lunarvim/colorschemes")
	use("catppuccin/nvim")
	use("kvrohit/substrata.nvim")
	use("sainnhe/edge")
	use("sainnhe/gruvbox-material")
	use("olimorris/onedarkpro.nvim")
	-- use "lunarvim/darkplus.nvim"
	-- use "ChristianChiarulli/nvcode-color-schemes.vim"

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Nvim Tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to -- use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("jose-elias-alvarez/typescript.nvim") -- for formatters and linters
	use("github/copilot.vim") -- Github Copilot.
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "VimEnter",
	-- })
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("rafamadriz/friendly-snippets")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch onippets to -- use

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- UI
	-- use("folke/trouble.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"ldelossa/gh.nvim",
		requires = { { "ldelossa/litee.nvim" } },
	})
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	})
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "kdheepak/lazygit.nvim" })

	-- Utilities
	use({
		"kylechui/nvim-surround",
	})
	use({ "ThePrimeagen/harpoon" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use({ "zbirenbaum/neodim" })
	use({
		"numToStr/Comment.nvim",
	})
	use({ "windwp/nvim-ts-autotag" })
	use({
		"windwp/nvim-autopairs",
	})
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	---@diagnostic disable-next-line: undefined-global
	if packer_bootstrap then
		require("packer").sync()
	end
end)
