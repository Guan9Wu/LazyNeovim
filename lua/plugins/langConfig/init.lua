return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- sourcekit will be automatically installed with mason and loaded with lspconfig
        sourcekit = {},
      },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- shell
        "shfmt",
      },
    },
  },

  -- import extension modules of the specific language
  { import = "plugins.langConfig.c_cpp" },
  { import = "plugins.langConfig.kotlin" },
  { import = "plugins.langConfig.lua" },
  { import = "plugins.langConfig.python" },
}
