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
  use "wbthomason/packer.nvim"

  -- Lua Development
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "folke/neodev.nvim"

  -- Harpoon
  use "ThePrimeagen/harpoon"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "RRethy/vim-illuminate"
  use "lvimuser/lsp-inlayhints.nvim"
  use "ziglang/zig.vim"
  --[[ use "simrat39/inlay-hints.nvim" ]]
  --[[ use "https://git.sr.ht/~whynothugo/lsp_lines.nvim" ]]

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippet
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-context"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "rose-pine/neovim", as = "rose-pine" }

  -- Utility
  use "moll/vim-bbye"
  use "mhartington/formatter.nvim"
  --[[ use "MunifTanjim/prettier.nvim" ]]
  --[[ use "lewis6991/impatient.nvim" ]]

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Tabline
  use "akinsho/bufferline.nvim"

  -- Statusline
  use "christianchiarulli/lualine.nvim"

  -- Startup
  --[[ use "goolord/alpha-nvim" ]]

  -- Indent
  --[[ use "lukas-reineke/indent-blankline.nvim" ]]

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Comment
  use "numToStr/Comment.nvim"

  -- Terminal
  -- use({ "akinsho/toggleterm.nvim", commit = "dfce846c609b83feef3786930c5bd7e4bad851ac" })

  -- Project
  use "ahmedkhalf/project.nvim"

  -- Svelte

  -- Rust
  -- use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })
  -- use("Saecki/crates.nvim")

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "mbbill/undotree"

  -- Editing Support
  use "windwp/nvim-autopairs"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
