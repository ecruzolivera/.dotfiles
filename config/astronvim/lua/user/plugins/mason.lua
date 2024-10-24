-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "gopls",
        "jsonls",
        "lemminx",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "slint_lsp",
        "tsserver",
        "yamlls",
        "ltex",
        "kotlin_language_server",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "shfmt",
        -- "beautysh",
        -- "shellcheck",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "codelldb",
        "kotlin-debug-adapter",
        "chrome-debug-adapter",
      },
    },
  },
}
