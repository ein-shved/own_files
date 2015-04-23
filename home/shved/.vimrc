
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set autoindent


colorscheme solarized
set ai
set nocompatible
set smartindent
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set nowrap
set guioptions=ma
set gfn=Terminus\ Bold\ 8
set expandtab
set guioptions-=m
set spell spelllang=en

if (&filetype == "automake")
    set noexpandtab
endif
"set gfn=Liberation\ Mono
highlight Cursor guifg=white guibg=blue

set wildmenu
set wildmode=longest,list,full
set completeopt-=preview
"set fo+=t
"set tw=75

"filetype plugin on
"set omnifunc=ft-c-omni#Complete

let g:exec_path = getcwd()
let g:tag_name_path = exec_path . "/tags"
let g:session_name_path = getcwd() . "/Session.vim"

if ( has("gui_running") || exists("g:pseudo_gui") )
    if filereadable("tags")
        set tags=tags
    endif
    if filereadable("Session.vim")
        execute "source Session.vim"
    endif
    highlight Cursor guifg=white guibg=blue
    set background=dark
else
    set background=dark
endif

fu! SafeWithSession()
    exec "wa"
    exec "mksession!" . g:session_name_path
endfunction

let g:exec_tags = ":!/usr/bin/ctags -R --C-kinds=+defgmnstuv --tag-relative=no --c++-kinds=+p --fields=+iaS --extra=+q -f " . g:tag_name_path . " "  . g:exec_path
let g:exec_tags_set = ":set tags=" . tag_name_path

map <F8> :exec exec_tags<CR>:exec exec_tags_set<CR>
map <silent> <F9> :silent make<CR><F10><F11>
"imap <silent> <F9> :silent make<CR>
map <F10> :cnext<CR>
map <F11> :cprevious<CR>


set directory=$HOME/.vim_swaps
":TlistUpdate
map <F4> :TlistToggle<cr>

if ( has("gui_running") || exists("g:pseudo_gui") )
"    map <C-s> :w<CR> :mksession!<CR>
    set cursorline
    map <C-s> :call SafeWithSession()<CR>
    imap <C-s> <Esc>:call SafeWithSession()<CR>i<Right>
    map <C-c> "+y<CR>
    map <C-x> "+x<CR>
else
    map <M-s> :w<CR>
    map <M-c> "+y<CR>
    map <M-x> "+x<CR>
endif

map <C-v> "+gp<CR>
"map <C-V> "+gP<CR>
map <M-Left>  :bp<CR>
map <M-Right> :bn<CR>
map <C-l> :source Session.vim<CR>

map <C-w><C-Up> <C-w><Up>
map <C-w><C-Down> <C-w><Down>
map <C-w><C-Right> <C-w><Right>
map <C-w><C-Left> <C-w><Left>

map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Right> <C-w><Right>
map <C-Left> <C-w><Left>

" Fix keycodes
map ^[[1~ <Home>
map ^[[4~ <End>
imap ^[[1~ <Home>
imap ^[[4~ <End>

imap <C-Tab> <C-V><Tab>

" Selection search
vnoremap <M-/> <Esc>/\%V

augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%82v.*/
    autocmd FileType Makefile setlocal noexpandtab
    autocmd FileType makefile setlocal noexpandtab
    autocmd FileType xml setlocal tabstop=2
augroup END

" Пусть в NORMAL режиме работают русские клавиши
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х [
map Ъ ]
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

map <C-0> :tn<CR>
map <C-9> :tp<CR>
map <C-Space> :%s/\s\+$//<CR>
autocmd BufWritePre * :%s/\s\+$//e

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"set completeopt=menu,longest

set ea
autocmd VimResized * wincmd =
wincmd =

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
