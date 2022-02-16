local fn = vim.fn
local friendly_snipets_path = fn.stdpath("data") .. "/site/pack/packer/start/friendly-snipets"
local opts = {
    path = friendly_snipets_path,
    exclude = {},
    include = { "c", "cpp", "lua", "python" },
}
require("luasnip.loaders.from_vscode").load(opts)
