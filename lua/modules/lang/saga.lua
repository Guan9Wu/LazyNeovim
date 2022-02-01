local saga = require 'lspsaga'
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
keymap("n", "<Leader>gh", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opt)
-- preview definition
keymap("n", "<Leader>gd", [[:Lspsaga preview_definition<CR>]], opt)
-- code action
keymap("n", "<Leader>ca", [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opt)
keymap("x", "<Leader>ca", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opt)
-- show hover doc
keymap("n", "<Leader>dc", [[:Lspsaga hover_doc<CR>]], opt)
-- show signature help
keymap("n", "<Leader>gs", [[:Lspsaga signature_help<CR>]], opt)
-- rename
keymap("n", "<Leader>gr", [[:Lspsaga rename<CR>]], opt)
-- float terminal also you can pass the cli command in open_float_terminal function
keymap("n", "<A-t>", [[:Lspsaga open_floaterm<CR>]], opt)
keymap("t", "<A-t>", [[<C-\><C-n>:Lspsaga close_floaterm<CR>]], opt)






saga.init_lsp_saga {
    finder_action_keys = {
      open = 'o',
      vsplit = 's',
      split = 'h',
      quit = {'q', 'Esc'},
      scroll_down = '<A-j>',
      scroll_up = '<A-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = {'q', 'Esc'},
      exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<Esc>',
      exec = '<CR>'  -- quit can be a table
    },
    -- "single" "double" "round" "plus"
    border_style = "round",
}

