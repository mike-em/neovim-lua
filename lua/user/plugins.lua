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
  use({ "wbthomason/packer.nvim", commit = "16c5798b4968669174c76e978944a2c82653fe67" }) -- Have packer manage itself

  -- Lua Development
  use({ "nvim-lua/plenary.nvim", commit = "0dbe561ae023f02c2fb772b879e905055b939ce3" }) -- Useful lua functions used ny lots of plugins
  use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })
  use({ "folke/neodev.nvim", commit = "dcd34653b0f1d3e7ea9aeb3e37dc7c8da445c4fe" })

  -- LSP
  use({ "neovim/nvim-lspconfig", commit = "0517d8522dcec286b1dba47aa3ee1ed8f523aed6" }) -- enable LSP
  use({ "williamboman/mason.nvim", commit = "ee6a7f179ebf8aa9da9d53b1cf1b57d292ea0182" })
  use({ "williamboman/mason-lspconfig.nvim", commit = "dfdd771b792fbb4bad8e057d72558255695aa1a7" })
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "e45670abdcda293282b7a00d0e2f7d473e7d6251" }) -- archived!!! for formatters and linters
  use({ "ray-x/lsp_signature.nvim", commit = "58d4e810801da74c29313da86075d6aea537501f" })
  use({ "SmiteshP/nvim-navic", commit = "9c89730da6a05acfeb6a197e212dfadf5aa60ca0" })
  use({ "RRethy/vim-illuminate", commit = "76f28e858f1caae87bfa45fb4fd09e4b053fc45b" })
  use({ "lvimuser/lsp-inlayhints.nvim", commit = "3700e6458fb1702c12a7e33037fb17f649679552" })
  use({ "simrat39/inlay-hints.nvim", commit = "299ebd66f6c8e799762b03d887b08ba739e9a2a8" })
  use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "f53af96d4789eef39a082dbcce078d2bfc384ece" })

  -- Completion
  use({ "christianchiarulli/nvim-cmp", commit = "bb1b56429c1489d2b4defc45d77ea2bf3a2385bc" })
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" })

  -- Snippet
  use({ "L3MON4D3/LuaSnip", commit = "2f78933799ef1a8558057ea7d06d6ccb11140711" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "ebf6d6e83494cdd88a54a429340256f4dbb6a052" }) -- a bunch of snippets to use

  -- Syntax/Treesitter
  use({ "nvim-treesitter/nvim-treesitter", commit = "8e9cc89955ee5dcd9743ba47a9e6e44a78f648f8" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "e9062e2dfb9854e6a927370f2d720de354c88524" })
  use({ "windwp/nvim-ts-autotag", commit = "e254b306fb81ed69049cce526e7906150d73e0d1" })
  use({ "nvim-treesitter/nvim-treesitter-context", comit = "64828e2665081de062f426641c7049eb7f446599" })

  -- Fuzzy Finder/Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "20a37e43bb43c74c6091f9fea6551af0964ad45a" })

  -- Colorschemes
  use({ "folke/tokyonight.nvim", commit = "9a01eada39558dc3243278e6805d90e8dff45dc0" })

  -- Utility
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })

  -- Icon
  use({ "kyazdani42/nvim-web-devicons", commit = "bc11ee2498de2310de5776477dd9dce65d03b464" })

  -- Debugging
  -- use({ "mfussenegger/nvim-dap", commit = "66d33b7585b42b7eac20559f1551524287ded353" })
  -- use({ "rcarriga/nvim-dap-ui", commit = "225115ae986b39fdaffaf715e571dd43b3ac9670" })
  -- use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

  -- Tabline
  use({ "akinsho/bufferline.nvim", commit = "9961d87bb3ec008213c46ba14b3f384a5f520eb5" })

  -- Statusline
  use({ "christianchiarulli/lualine.nvim", commit = "5cfe1ad48b3efb8dea195139ed279d0c3e4c5995" })

  -- Startup
  use({ "goolord/alpha-nvim", commit = "63a860e7ed3ae41ee92481ea65a48fb35431ae21" })

  -- Indent
  use({ "lukas-reineke/indent-blankline.nvim", commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204" })

  -- File Explorer
  use({ "kyazdani42/nvim-tree.lua", commit = "920868dba13466586897a8f40220eca6b2caac41" })

  -- Comment
  use({ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" })

  -- Terminal
  -- use({ "akinsho/toggleterm.nvim", commit = "dfce846c609b83feef3786930c5bd7e4bad851ac" })

  -- Project
  use({ "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" })

  -- Rust
  -- use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })
  -- use("Saecki/crates.nvim")

  -- Git
  use({ "lewis6991/gitsigns.nvim", commit = "bae45ef449d8811061cc940459e70e883a3aa83a" })
  use({ "tpope/vim-fugitive", commit = "f71fb9936072872ec5284a92223f279cab3153af" })
  use({ "mbbill/undotree", commit = "485f01efde4e22cb1ce547b9e8c9238f36566f21" })

  -- Editing Support
  use({ "windwp/nvim-autopairs", commit = "a52fc6eeec116746110b703381777c46d89d9e27" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
