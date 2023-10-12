return {
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
  -- { import = "plugins.langConfig.kotlin" },
  -- { import = "plugins.langConfig.lua" },
  { import = "plugins.langConfig.markdown_latex" },
}
