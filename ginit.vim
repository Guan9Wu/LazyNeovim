" For neovim-qt
" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont Hack Nerd Font:h16
endif

if exists(':GuiAdaptiveFont')
    GuiAdaptiveFont 1
endif

" GUI Tabline
if exists(':GuiTabline')
    GuiTabline 1
endif

" GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 1
endif

" GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" GUI Adaptive Color
if exists(':GuiAdaptiveColor')
    GuiAdaptiveColor 1
endif

" GUI Window Opacity
if exists(':GuiWindowOpacity')
    GuiWindowOpacity 0.1
endif

" Right Click Context Menu (Copy-Cut-Paste)
" nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
" xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
" snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
