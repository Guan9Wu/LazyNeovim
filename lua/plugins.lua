vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
	-- package manager
	use("wbthomason/packer.nvim")
	-- lua functions
	use("nvim-lua/plenary.nvim")
	-- icons for other plugins
	use("kyazdani42/nvim-web-devicons")

	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	-- snippet support
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")
	-- lsp support
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
-- null-ls for missing ls functionalities
	use("jose-elias-alvarez/null-ls.nvim")
	-- lsp UI staffs
	use("tami5/lspsaga.nvim")
	-- treesitter config
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter")
	-- auto pairs
	use("windwp/nvim-autopairs")
	-- comment
	use("numToStr/Comment.nvim")
	-- indent
	use("glepnir/indent-guides.nvim")
	-- status line
	use("windwp/windline.nvim")
	-- clickable buffer line
	use("romgrk/barbar.nvim")
	-- git integration
	use("lewis6991/gitsigns.nvim")
	-- which-key
	use("folke/which-key.nvim")
	-- file explorer
	use("kyazdani42/nvim-tree.lua")
	-- fuzzy finder
	use("nvim-telescope/telescope.nvim")
	use{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	-- media file preview extension for telescope
	use("nvim-telescope/telescope-media-files.nvim")
	-- colorscheme
	use("folke/tokyonight.nvim")
	-- colorizer
	use("norcalli/nvim-colorizer.lua")
	-- debuger
	use("sakhnik/nvim-gdb")
	-- startup
	use("glepnir/dashboard-nvim")
end)

local modules = {
  editor = {
    "theme",
    "bbline",
    "windline",
    "colorizer",
    "dashboard",
  },
  produc = {
    "gitsigns",
    "indent",
    "telescope",
    "tree",
    "whichkey",
  },
  lang = {
    "cmp",
    "comment",
    "lspconf",
    "luasnip",
    "nullls",
    "saga",
    "treesitter",
  },
  gui = {
    "neovide",
  }
}

function load_modules(modules)
  for name, mods in pairs(modules) do
    for _, mod in ipairs(mods) do
      mod_path = "modules." .. name .. "." .. mod
      require(mod_path)
    end
  end
end

load_modules(modules)
