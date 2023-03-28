-- what is the OS
local path_sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

local M = {}

-- create keymap group for which-key
M.create_keymap_group = function(key, name, mode)
  local success, wk = pcall(require, "which-key")
  if not success then
    return
  end
  wk.register({
    mode = mode or { "n", "v" },
    [key] = { name = name },
  })
end

return M
