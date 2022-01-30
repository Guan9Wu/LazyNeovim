local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = false}

-- Save & quit
map("", "<C-q>", ":bdelete<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)

-- Open the init.vim file anytime
map("n", "<leader>rc", ":e $MYVIMRC<cr>", opts)

-- Copy and paste
map("", "Y", "\"+y", opts)
map("", "P", "\"+p", opts)

-- Cursor movement
map("", "H", "^", opts)
map("", "L", "$", opts)
map("", "<S-k>", "5<C-y>", opts)
map("", "<S-j>", "5<C-e>", opts)

map("i", "<A-h>", "<left>", opts)
map("i", "<A-l>", "<right>", opts)
map("i", "<A-j>", "<down>", opts)
map("i", "<A-k>", "<up>", opts)

-- Terminal
map("t", "<A-q>", "<C-\\><C-n>", opts)  -- quit

map("t", "<A-h>", "<C-\\><C-n><C-w>h", opts)  -- shift window
map("t", "<A-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<A-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<A-l>", "<C-\\><C-n><C-w>l", opts)

-- Windows and buffers
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Resize splits with arrow keys
map("", "<up>", ":resize +5<CR>", opts)
map("", "<down>", ":resize -5<CR>", opts)
map("", "<left>", ":vertical resize-5<CR>", opts)
map("", "<right>", ":vertical resize+5<CR>", opts)

-- Place the two screens up and down
map("", "sh", "<C-w>t<C-w>K", opts)
-- Place the two screens side by side
map("", "sv", "<C-w>t<C-w>H", opts)

-- Rotate screens
map("", "srh", "<C-w>b<C-w>K", opts)
map("", "srv", "<C-w>b<C-w>H", opts)

-- Create a new tab with tu
map("", "tk", ":tabe<CR>", opts)
--Shift around tabs with th and tl
map("", "th", ":-tabnext<CR>", opts)
map("", "tl", ":+tabnext<CR>", opts)

-- find and replace
map("", "\\s", ":%s///g<left><left><left>", opts)
