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

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Mangager
	use({ "wbthomason/packer.nvim", commit = "afab89594f4f702dc3368769c95b782dbdaeaf0a" }) -- Have packer manage itself

	-- Lua Development
	use({ "nvim-lua/plenary.nvim", commit = "31807eef4ed574854b8a53ae40ea3292033a78ea" }) -- Useful lua functions used ny lots of plugins
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })
	use({ "folke/lua-dev.nvim", commit = "f5c31936fe06fcbeb59b98f69f74f9c2f91abaec" })

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "6e047f11861bfb6ec28a6ad0138a8f0a62bb8806" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "6b76bcec15e9d7c01a10a1e03dd6c62d20ca3af5" }) -- simple to use language server installer
	use({ "williamboman/mason.nvim", commit = "cd1af57253b3ac3652765e4d0f83b56802ec2a5f" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "f5b207bf8f33c9c93384337188b84d58d2432918" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "53622ed39ffe9cf59fad89d1cbfb6edfb94a5d20" }) -- for formatters and linters
	use({ "ray-x/lsp_signature.nvim", commit = "4665921ff8e30601c7c1328625b3abc1427a6143" })
	use({ "SmiteshP/nvim-navic", commit = "94bf6fcb1dc27bdad230d9385da085e72c390019" })
	use({ "RRethy/vim-illuminate", commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be" })
	use({ "lvimuser/lsp-inlayhints.nvim", commit = "d9a84a7afc3a98065a9245ec5f797eeffef507e7" })
	use({ "simrat39/inlay-hints.nvim", commit = "7ec15ee9ff270265f59cd99d2ccbcd1ad2aa90d8" })
	use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dbfd8e96ec2696e1ceedcd23fd70e842256e3dea" })

	-- Completion
	use({ "christianchiarulli/nvim-cmp", commit = "8b47c62c2c82a7e1d86d8f4d12f2e59fc633f0c6" })
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- Snippet
	use({ "L3MON4D3/LuaSnip", commit = "c599c560ed26f04f5bdb7e4498b632dc16fb9209" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "7339def34e46237eb7c9a893cb7d42dcb90e05e6" }) -- a bunch of snippets to use

	-- Syntax/Treesitter
	use({ "nvim-treesitter/nvim-treesitter", commit = "a9a6493b1eeba458757903352e0d3dc4b54fd4f2" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "7d0b001cd6ec2adc25b8d81496c5ef3bd188f781" })
	use({ "p00f/nvim-ts-rainbow", commit = "a37f5e0afbb8ab91946121c750a8e422158baa10" })
	use({ "windwp/nvim-ts-autotag", commit = "044a05c4c51051326900a53ba98fddacd15fea22" })

	-- Fuzzy Finder/Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "4725867ec66b9a0f5e5ad95a1fd94c2f97fa2d2c" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" })

	-- Utility
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "lewis6991/impatient.nvim", commit = "4ccbe749ce439fa25d387d459e8c339131cc5d1f" })

	-- Icon
	use({ "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" })

	-- Debugging
	use({ "mfussenegger/nvim-dap", commit = "66d33b7585b42b7eac20559f1551524287ded353" })
	use({ "rcarriga/nvim-dap-ui", commit = "225115ae986b39fdaffaf715e571dd43b3ac9670" })
	use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

	-- Tabline
	use({ "akinsho/bufferline.nvim", commit = "7ca869b6268f4536799f7a4e534b39a28d38696a" })

	-- Statusline
	use({ "christianchiarulli/lualine.nvim", commit = "473baa28f8eb3e30a1e8421cb63f919593d82e97" })

	-- Startup
	use({ "goolord/alpha-nvim", commit = "d688f46090a582be8f9d7b70b4cf999b780e993d" })

	-- Indent
	use({ "lukas-reineke/indent-blankline.nvim", commit = "c15bbe9f23d88b5c0b4ca45a446e01a0a3913707" })

	-- File Explorer
	use({ "kyazdani42/nvim-tree.lua", commit = "ff6e7966f39a897ac4d1358f4d022cfecdc88ff1" })

	-- Comment
	use({ "numToStr/Comment.nvim", commit = "9b76787e273567c0e3027304bd16ffedc751c04c" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim", commit = "dfce846c609b83feef3786930c5bd7e4bad851ac" })

	-- Project
	use({ "ahmedkhalf/project.nvim", commit = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f" })

	-- Rust
	use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })
	use("Saecki/crates.nvim")

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "9c3ca027661136a618c82275427746e481c84a4e" })
	use({ "tpope/vim-fugitive", commit = "66a921bbe38bea19f6b581c8a56d5a8a41209e35" })

	-- Editing Support
	use({ "windwp/nvim-autopairs", commit = "ca89ab9e7e42aa9279f1cdad15398d6e18ccee86" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
