return {
  -- add markdown/latex to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "latex" })
      end
    end,
  },

  -- add markdown/latex to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "ltex-ls",
          "prettierd",
        })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        ltex = {
          language = { "en", "zh_CN" },
        },
      },
    },
  },

  -- add formater
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- table.insert(opts.sources, nls.builtins.diagnostics.pylint)
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },

  -- extra plusins
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "microsoft-edge-dev"
      vim.g.mkdp_auto_start = 1
    end,
    ft = { "markdown" },
  },
}
