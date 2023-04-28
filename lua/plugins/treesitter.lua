return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Rainbow delimiters for Neovim through Tree-sitter
      -- "HiPhish/nvim-ts-rainbow2",
    },
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "css",
        "comment",
        "dockerfile",
        "go",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "latex",
        "llvm",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        -- disable = { "jsx", "cpp" },
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        -- TODO Fix the bug
        -- strategy = require("ts-rainbow").strategy.global,
      },
    },
  },
}
