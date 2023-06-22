return {
  -- add lua to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" })
      end
    end,
  },

  -- add lua to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "lua-language-server",
          "stylua",
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
        lua_ls = {
          cmd = { "lua-language-server", "-E" },
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "Lua 5.1",
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
                disable = { "missing-parameter" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                  vim.api.nvim_get_runtime_file("", true),
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
              completion = {
                callSnippet = "Both",
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
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },
}
