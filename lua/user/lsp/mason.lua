local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "tailwindcss",
  "gopls",
  "zls",
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "eslint",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "lua_ls",
  "svelte",
  "tflint",
  "terraformls",
  "ts_ls",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "zk@v0.10.1",
  "lemminx",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "yamlls" then
    local yamlls_opts = require "user.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "gopls" then
    local gopls = require "user.lsp.settings.gopls"
    opts = vim.tbl_deep_extend("force", gopls, opts)
  end

  if server == "svelte" then
    local svelte = require "user.lsp.settings.svelte"
    opts = vim.tbl_deep_extend("force", svelte, opts)
  end

  if server == "eslint" then
    local eslint = require "user.lsp.settings.eslint"
    opts = vim.tbl_deep_extend("force", eslint, opts)
  end

  if server == "zls" then
    local zls = require "user.lsp.settings.zig"
    opts = vim.tbl_deep_extend("force", zls, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require "user.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "zk" then
    local zk_opts = require "user.lsp.settings.zk"
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  if server == "rust_analyzer" then
    local rust_opts = require "user.lsp.settings.rust"
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      return
    end

    rust_tools.setup(rust_opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
