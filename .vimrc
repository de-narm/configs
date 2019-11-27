"Vundle begin
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()        

"YCM config
let g:ycm_global_ycm_extra_conf = ''

"turn off errors
let g:ycm_max_diagnostics_to_display = 0

"turn off identifier completion
let g:ycm_min_num_of_chars_for_completion = 1

"stop asking about loading the config
let g:ycm_confirm_extra_conf = 0

"auto-close preview
let g:ycm_autoclose_preview_window_after_insertion = 0
"Vundle end




"well, syntaxhighlighting
syntax on

"wrap according to window size
"set wrap

"show partial commands
set showcmd

"indent new line 
set autoindent

"numbers
set number

"yank across terminals 
set clipboard+=unnamend

"mark 80 chars in column
set colorcolumn=80
highlight ColorColumn ctermbg=0

"tab key uses space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"tabstop for clojure
autocmd Filetype clojure setlocal tabstop=2
autocmd Filetype clojure setlocal softtabstop=2
autocmd Filetype clojure setlocal shiftwidth=2

"no reselect after indention
vnoremap > >gv
vnoremap < <gv

"read changes from outside to opend file
set autoread

"clang
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
