local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        selection_strategy = "row",
        borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
        initial_mode = "insert",
        dynamic_preview_title = true,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        mappings = {
            i = {
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-a>"] = actions.toggle_all,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-?>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-w>"] = { "<c-s-w>", type = "command" },

                ["<Del>"] = actions.delete_buffer,
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-a>"] = actions.toggle_all,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
                ["<Del>"] = actions.delete_buffer,
            },
        },
    },

    pickers = {},
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
        },
    },
})

require("telescope").load_extension("media_files")

local opt = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- mappings
keymap("n", "<Leader>ff", [[<Cmd>lua require("telescope.builtin").fd()<CR>]], opt)
keymap("n", "<Leader>fww", [[<Cmd>lua require("telescope.builtin").live_grep()<CR>]], opt)
keymap("n", "<Leader>fwc", [[<Cmd>lua require("telescope.builtin").grep_string()<CR>]], opt)
keymap("n", "<Leader>fb", [[<Cmd>lua require("telescope.builtin").buffers()<CR>]], opt)
keymap("n", "<Leader>fo", [[<Cmd>lua require("telescope.builtin").oldfiles()<CR>]], opt)
keymap("n", "<Leader>fc", [[<Cmd>lua require("telescope.builtin").commands()<CR>]], opt)
keymap("n", "<Leader>fm", [[<Cmd>lua require("telescope.builtin").marks()<CR>]], opt)
keymap("n", "<Leader>fq", [[<Cmd>lua require("telescope.builtin").quickfix()<CR>]], opt)
keymap("n", "<Leader>fk", [[<Cmd>lua require("telescope.builtin").keymaps()<CR>]], opt)
keymap("n", "<Leader>fh", [[<Cmd>lua require("telescope.builtin").help_tags()<CR>]], opt)

-- highlights
local cmd = vim.cmd

cmd("hi TelescopeBorder   guifg=#2a2e36")
cmd("hi TelescopePromptBorder   guifg=#2a2e36")
cmd("hi TelescopeResultsBorder  guifg=#2a2e36")
cmd("hi TelescopePreviewBorder  guifg=#525865")
