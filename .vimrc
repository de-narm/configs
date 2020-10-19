"training wheels
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"well, syntaxhighlighting
syntax on

"wrap according to window size
set wrap lbr

"show partial commands
set showcmd

"indent new line 
set autoindent

"numbers
set number relativenumber

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

"spellcheck
autocmd Filetype tex,latex,plaintex setlocal spell spelllang=en_gb

"no reselect after indention
vnoremap > >gv
vnoremap < <gv

"read changes from outside to opend file
set autoread

""Filespecific changes
"clojure tabstops 
autocmd Filetype clojure setlocal tabstop=2
autocmd Filetype clojure setlocal softtabstop=2
autocmd Filetype clojure setlocal shiftwidth=2

"latex movements
autocmd Filetype tex,latex,plaintex noremap <silent> k gk
autocmd Filetype tex,latex,plaintex noremap <silent> j gj
autocmd Filetype tex,latex,plaintex noremap <silent> 0 g0
autocmd Filetype tex,latex,plaintex noremap <silent> $ g$
