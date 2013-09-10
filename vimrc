execute pathogen#infect()
syntax on
filetype plugin indent on

" Line numbering
set number
highlight LineNr ctermfg=Black ctermbg=Magenta

" Soft tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Auto remove trailing spaces
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Disable "Ex-mode"
:nnoremap Q <Nop>

" Restyle vertical split window
:set fillchars+=vert:\ 
