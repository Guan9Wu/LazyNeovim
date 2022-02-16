local global = {}
local path_sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

function global:load_variables()
    self.config_path = vim.fn.stdpath("config")
    self.cache_dir = vim.fn.stdpath("cache")
    self.modules_dir = self.config_path .. path_sep .. "modules"
    self.path_sep = path_sep
    self.data_dir = vim.fn.stdpath("data")
end

global:load_variables()

return global
