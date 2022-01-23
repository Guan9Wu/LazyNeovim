return require("packer").startup(function(use)
    -- package manager
    use("wbthomason/packer.nvim")
    -- lua functions
    use("nvim-lua/plenary.nvim")
    -- icons for other plugins
    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    })

    -- auto completion
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("modules.cmp")
        end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    -- snippet support
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- lsp support
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("modules.lspconf")
        end,
    })
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-cmdline")

    -- null-ls for missing ls functionalities
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("modules.nullls")
        end,
    })
    -- lsp UI staffs
    use({
        "tami5/lspsaga.nvim",
        config = function ()
            require("modules.saga")
        end,
    })
    -- treesitter config
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("modules.treesitter")
        end,
    })
    -- auto pairs
    use("windwp/nvim-autopairs")
    -- comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("modules.comment")
        end,
    })
    -- indent
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("modules.indent")
        end,
    })

    -- status line
    use({
        "windwp/windline.nvim",
        config = function()
            require("modules.windline")
        end,
    })
    -- clickable buffer line
    use({
        "romgrk/barbar.nvim",
       -- "akinsho/nvim-bufferline.lua",
       config = function()
           -- require("modules.bufline")
           require("modules.bbline")
       end,
    })
    -- git integration
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("modules.gitsigns")
        end,
    })
    -- which-key
    use({
        "folke/which-key.nvim",
        config = function()
            require("modules.whichkey")
        end,
    })

    -- file explorer
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("modules.tree")
        end,
    })
    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("modules.telescope")
        end,
    })
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    -- media file preview extension for telescope
    use("nvim-telescope/telescope-media-files.nvim")
    -- colorscheme
    use({
        "folke/tokyonight.nvim",
        config = function()
            require("modules.editor.theme")
        end,
    })
end)
