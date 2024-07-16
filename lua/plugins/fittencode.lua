return {
  -- fittencode cmp source
  {
    "nvim-cmp",
    dependencies = {
      -- fitten code
      {
        "luozhiya/fittencode.nvim",
        config = function()
          require("fittencode").setup({
            completion_mode = "source",
          })
        end,
      },
    },
    ------@param opts cmp.ConfigSchema
    ---opts = function(_, opts)
    ---  table.insert(opts.sources, 1, {
    ---    name = "fittencode",
    ---    group_index = 1,
    ---    priority = 100,
    ---  })
    ---end,
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("fittencode"))
  --   end,
  -- },
}
