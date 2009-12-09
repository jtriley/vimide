filetype indent on
"PERSONAL SETTINGS
set nowrap
set ignorecase
set smartcase
set title
set ruler
set incsearch
set visualbell
set autochdir
set number
set scrolloff=3
set history=1000
"set shortmess=atI

"drop-down menu options
set wildmenu
set wildmode=list:longest
set completeopt+=longest,menuone

""folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"toggle highlighted search with c-n
function ToggleHLSearch()
       if &hls
            set nohls
       else
            set hls
       endif
endfunction
nmap <silent> <C-n> <Esc>:call ToggleHLSearch()<CR>

"remap f1 from help menu to esc
map <F1> <Esc>
imap <F1> <Esc>

"keymap for setting paste mode
set pastetoggle=<C-x>

" map dot to .
function! DropDownMenu()
	if exists('&omnifunc') && &omnifunc != ''
		return ".\<C-X>\<C-O>"
	else
		return "."
	endif
endfunction

command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
    endfunction

command Pyflakes :call Pyflakes()
fun! Pyflakes()
	set makeprg=pyflakes
	make "%"
	cw
endfunction

imap <silent> <buffer> . <c-r>=DropDownMenu()<CR>

nnoremap <F2> :set invnumber<CR>
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" show TODO list
nnoremap <silent> <F7> :TaskList<CR>

"show outline explorer 
nnoremap <silent> <F8> :TlistToggle<CR>
"show project explorer
nnoremap <silent> <F9> :NERDTreeToggle<CR>

"unravel one line xml files
autocmd FileType xml nmap <F2> <Esc>:1,$!xmllint --format -<CR>

" omnicomplete/supertab settings
"let g:SuperTabDefaultCompletionTypeDiscovery = "&omnifunc:<C-X><C-O>,&completefunc:<C-X><C-U>"
"let g:SuperTabLongestHighlight = 1

" Popup menu hightLight Group
highlight Pmenu ctermbg=Blue guibg=LightGray
highlight PmenuSel ctermbg=DarkRed guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=DarkGrey guibg=DarkGray
highlight PmenuThumb guibg=Black


" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
"let g:miniBufExplForceSyntaxEnable = 1 " There is a Vim bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
"let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guibg=LightGray guifg=DarkGray
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guibg=Red guifg=DarkRed
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black
let g:pydiction_location = '~/.vim/vimfiles/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 15

" NERDTree Settings
let g:NERDTreeWinPos = "right"
