local wk = require("which-key")
wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<A-j>", -- binding to scroll down inside the popup
        scroll_up = "<A-k>", -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
    wk.register({
        ["<leader>"] = {
            f = {
                name = "+File & Find",
                n = { "<cmd>enew<cr>", "New File" },
                r = { "Find and Replace" },
                f = { "<cmd>Telescope find_files<cr>", "Find Files in Workspace" },
                o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                c = { "<cmd>Telescope commands<cr>", "Find Commands" },
                b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
                k = { "<cmd>Telescope keymaps<cr>", "Find Keymaps" },
                h = { "<cmd>Telescope help_tags<cr>", "Find help_tags" },
                w = { "<cmd>Telescope live_grep<cr>", "Find Word in Workspace" },
                W = { "<cmd>Telescope grep_string<cr>", "Find String under cursor" },
            },
            s = {
                name = "+Windows Layout",
                h = { "Up and Down Layout" },
                v = { "Left and Right Layout" },
                H = { "Swap Up and Down" },
                V = { "Swap Left and Right" },
            },
            c = {
                name = "+Change Directory",
                d = { "Change Workspace" },
            },
            g = {
                name = "+Gitsigns",
                j = { "Next Hunk" },
                k = { "Previous Hunk" },
                s = { "Stage Hunk" },
                r = { "Reset Hunk" },
                S = { "Stage Buffer" },
                R = { "Reset Buffer" },
                u = { "Undo Stage Hunk" },
                p = { "Preview Hunk" },
                D = { "Diff against the index" },
                d = { "Diff against the last commit" },
            },
            l = {
                name = "+Lspsaga",
                h = { "Definition and Reference" },
                a = { "Code Action" },
                r = { "Rename Variable" },
                d = { "Definition in Floating Window" },
                o = { "Tags Outline" },
                l = { "Hover Doc" },
            },
            d = {
                name = "DAP Debuger",
                c = { "Start and Continue" },
                n = { "Step Over" },
                i = { "Step Into" },
                o = { "Step Out" },
                b = { "Toggle Breakpoint" },
            }
        },
        ['g'] = {
            name = "Comments",
            l = {
                name = "Line Comments",
                c = { "Toggle Line Comments" },
                j = { "Comment on the line below" },
                k = { "COmment on the line above" },
                e = { "Comment on the end of line" },
            },
            b = {
                name = "Block Comments",
                c = { "Toggle Block Comments" },
            }
        }
    })
})
