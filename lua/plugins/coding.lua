return {
  -- leetcode
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      cn = {
        enabled = true,
      },
      plugins = {
        non_standalone = true,
      },
      injector = {
        ["python3"] = {
          before = true,
        },
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          after = "}; \n int main() {}",
        },
        ["java"] = {
          before = "import java.util.*;",
        },
      },
    },
  },
}
