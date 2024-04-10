return {
  -- c/cpp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=google",
          },
        },
      },
    },
  },
  -- markdown
  -- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
      linters = {
        markdownlint = {
          cmd = "markdownlint",
          -- args = { "--disable", "MD033", "--fix" },
          args = {
            "--config",
            "~/.config/nvim/lspconfigs/markdownlint.jsonc",
          },
        },
      },
    },
  },
}
