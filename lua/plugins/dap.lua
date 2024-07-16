return {
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      commented = true, -- prefix virtual text with comment string
      all_references = true, -- show virtual text on all all references of the variable (not only definitions)
      all_frames = true, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    },
  },
}
