execute pathogen#infect()
syntax on
filetype plugin indent on

" Line numbering
set number
highlight LineNr ctermfg=Black ctermbg=Magenta

" Soft tabs
set expandtab
set tabstop=2

" Auto remove trailing spaces
autocmd BufWritePre *.py :%s/\s\+$//e
