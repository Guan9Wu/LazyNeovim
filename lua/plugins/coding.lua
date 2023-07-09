return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
    opts = {
      hover_symbol = "K",
      toggle_preview = "P",
      fold_all = "H",
      unfold_all = "L",
    },
    config = true,
  },
  {
    "ahmedkhalf/project.nvim",
    opts = { scope_chdir = "tab" },
  },
}
