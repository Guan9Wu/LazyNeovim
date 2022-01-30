require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = true,
  ignore_install = {},

  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
      enabel = true,
  }
}
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
