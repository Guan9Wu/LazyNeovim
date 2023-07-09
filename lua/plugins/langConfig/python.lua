return {
  -- add python to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python" })
      end
    end,
  },

  -- add python to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "pyright",
          "debugpy",
          "pylint",
          "black",
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
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
              pythonPath = {
                -- "/home/gavyn/.conda/pkgs/",
                -- "/home/gavyn/.conda/envs/realsense/lib/python3.10/",
                -- "/home/gavyn/.conda/envs/test/lib/python3.10",
                -- "/home/gavyn/.conda/envs/test/lib/python3.10/site-packages/cv2",
                -- "/usr/lib/python3.11/",
                -- "/home/gavyn/.conda/envs/gpt/lib/python3.11/",
              },
            },
          },
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
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
}
