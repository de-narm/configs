"""""""""""""""""""""Basics""""""""""""""""""""""""""""""""""""""""""""""""""""
"well, syntaxhighlighting
syntax on

"wrap according to window size
set wrap lbr

"show partial commands
set showcmd

"numbers
set number relativenumber

"mark 80 chars in column
set colorcolumn=80
highlight ColorColumn ctermbg=0

"yank across terminals 
set clipboard+=unnamend

"read changes from outside to opend file
set autoread

"indent new line 
set autoindent
set smartindent

"autocomplete subfolderpaths
set path+=**

"display all matching files with tab complete
set wildmenu

"tab key uses space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"fold all functions when opening file
"set foldmethod=syntax
"set foldnestmax=1
"highlight Folded ctermbg=Black

"""""""""""""""""""""General Keys""""""""""""""""""""""""""""""""""""""""""""""
"no reselect after indention
vnoremap > >gv
vnoremap < <gv

"deactivate arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"""""""""""""""""""""Filespecific changes""""""""""""""""""""""""""""""""""""""
"clojure tabstops 
autocmd Filetype clojure setlocal tabstop=2
autocmd Filetype clojure setlocal softtabstop=2
autocmd Filetype clojure setlocal shiftwidth=2

"latex spellcheck 
autocmd Filetype tex,latex,plaintex setlocal spell spelllang=en_gb

"latex movements in wrapped lines
autocmd Filetype tex,latex,plaintex noremap <silent> k gk
autocmd Filetype tex,latex,plaintex noremap <silent> j gj
autocmd Filetype tex,latex,plaintex noremap <silent> 0 g0
autocmd Filetype tex,latex,plaintex noremap <silent> $ g$
