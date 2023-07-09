return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- sourcekit will be automatically installed with mason and loaded with lspconfig
        -- sourcekit = {},
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

  -- null-ls default configuration
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.code_actions.gitsigns)
    end,
  },

  -- import extension modules of the specific language
  -- { import = "plugins.langConfig.c_cpp" },
  { import = "plugins.langConfig.kotlin" },
  { import = "plugins.langConfig.lua" },
  -- { import = "plugins.langConfig.python" },
  { import = "plugins.langConfig.markdown_latex" },
}
