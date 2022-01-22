" ===
" === Basic Mappings
" ===

" Disable the default s key
noremap s <nop>
noremap S <nop>
noremap b <nop>
noremap B <nop>
" same as <BS>
nnoremap <C-H> <nop>
" Same sa <Tab>
nnoremap <C-I> <nop>
" Same as <CR>
nnoremap <C-J> <nop>
nnoremap <C-M> <nop>
" Same as <Esc>
nnoremap <C-[> <nop>


" Save & quit
nnoremap <C-q> :bdelete<CR>
noremap <C-s> :w<CR>

" Open the init.vim file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>

" sourece $MYVIMRC
nnoremap R :source $MYVIMRC<CR>

" Copy to system clipboard
vnoremap Y "+y

" Paste from system cliboard
nnoremap P "+p

" Uncomment the following to have Vim jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Cursor Movement
" ===

" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k
" < h   l >
"     j
"     v

" H key: go to the start of the line
noremap <silent> H ^
" L key: go to the end of the line
noremap <silent> L $

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <S-k> 5<C-y>
noremap <S-j> 5<C-e>

" show the full path of current file
noremap \p :echo expand('%:p')<CR>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <A-h> <Left>
inoremap <A-l> <Right>
inoremap <A-j> <Down>
inoremap <A-k> <Up>

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>

" ===
" === Terminal
" ===

" Quit from the inserting mode of shell
tnoremap <A-q> <C-\><C-n>

" Windows shifting
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" ===
" === Windows and buffers management
" ===
" Some commands for better using:

" :sp  :vs  :new  :vne
" Use <space> + new arrow keys for moving the cursor around windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Shift to the previous window
noremap <A-w> <C-w>w

" Resize splits with arrow keys
noremap <up> :resize +5<CR>
noremap <down> :resize -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tk :tabe<CR>
"Shift around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" find and replace
noremap \s :%s///g<left><left><left>

" Compile function
"noremap <F5> :call CompileRunGcc()<CR>
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
		:term .\%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
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
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

