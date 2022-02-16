local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

-- Save & quit
map("", "<C-q>", ":qa<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)

-- Open the init.vim file anytime
map("n", "<leader>rc", ":e $MYVIMRC<cr>", opts)

-- Copy and paste
map("", "Y", '"+y', opts)
map("", "P", '"+p', opts)

-- Cursor movement
map("", "H", "^", opts)
map("", "L", "$", opts)
map("", "<S-k>", "5<C-y>", opts)
map("", "<S-j>", "5<C-e>", opts)

map("i", "<A-h>", "<left>", opts)
map("i", "<A-l>", "<right>", opts)
map("i", "<A-j>", "<down>", opts)
map("i", "<A-k>", "<up>", opts)

map("c", "<A-h>", "<left>", opts)
map("c", "<A-l>", "<right>", opts)
map("c", "<A-j>", "<down>", opts)
map("c", "<A-k>", "<up>", opts)

-- Terminal
-- map("t", "<A-q>", "<C-\\><C-n>", opts)  -- quit
map("t", "<Esc>", "<C-\\><C-n>", opts) -- quit

map("t", "<A-h>", "<C-\\><C-n><C-w>h", opts) -- shift window
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
map("", "<leader>sh", "<C-w>t<C-w>K", opts)
-- Place the two screens side by side
map("", "<leader>sv", "<C-w>t<C-w>H", opts)

-- Rotate screens
map("", "<leader>rh", "<C-w>b<C-w>K", opts)
map("", "<leader>rv", "<C-w>b<C-w>H", opts)

-- find and replace
map("", "\\s", ":%s///g<left><left><left>", opts)

-- run code
cmd([[
  noremap <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
  	exec "w"
  	if &filetype == 'c'
  		exec "!g++ % -o %<"
  		exec "!time ./%<"
  	elseif &filetype == 'cpp'
  		set splitbelow
  		exec "!g++ -std=c++11 % -Wall -o %<"
  		:sp
  		:res -15
  		:Lspsaga open_floaterm ./%<
  	elseif &filetype == 'java'
  		exec "!javac %"
  		exec "!time java %<"
  	elseif &filetype == 'sh'
  		:!time bash %
  	elseif &filetype == 'python'
  		set splitbelow
  		:sp
  		:Lspsaga open_floaterm python3 %
  	elseif &filetype == 'html'
  		silent! exec "!".g:mkdp_browser." % &"
  	elseif &filetype == 'markdown'
  		exec "InstantMarkdownPreview"
  	elseif &filetype == 'tex'
  		silent! exec "VimtexStop"
  		silent! exec "VimtexCompile"
  	elseif &filetype == 'dart'
  		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
  		silent! exec "CocCommand flutter.dev.openDevLog"
  	elseif &filetype == 'javascript'
  		set splitbelow
  		:sp
  		:Lspsaga open_floaterm export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  	elseif &filetype == 'go'
  		set splitbelow
  		:sp
  		:Lspsaga open_floaterm go run .
  	endif
  endfunc
]])
