"well, syntaxhighlighting
syntax on

"wrap according to window size
set wrap

"show partial commands
set showcmd

"keep the smae line 
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

"no reselect after indention
vnoremap > >gv
vnoremap < <gv

"clang
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
