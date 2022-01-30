
call plug#begin(stdpath('data').'/plugged')

" Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" General Highlighter
Plug 'RRethy/vim-illuminate'

" Undotree
Plug 'mbbill/undotree'

call plug#end()


" Colortheme
colorscheme tokyonight

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 100

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END

" Highlight word under cursor (default: 1)
let g:Illuminate_highlightUnderCursor = 1

" ===
" === Undotree
" ===
noremap <LEADER>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc
