execute pathogen#infect()
syntax on
filetype plugin indent on

" Line numbering
set number
highlight LineNr ctermfg=Black ctermbg=Magenta

" Right margins
set cc=78,80,100,120
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

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
nnoremap Q <Nop>

" Restyle vertical split window
set fillchars+=vert:\ 

" Use a more convenient leader
let mapleader = ","

" Remappings for colemak
noremap h n
noremap n h
noremap H N
noremap N H
noremap e j
noremap j e
noremap I K
noremap K I
noremap i k
noremap k i
noremap O L
noremap L O
noremap o l
noremap l o

" Pane switching remaps
:nmap <C-w>n :wincmd h<CR>
:nmap <C-w>e :wincmd j<CR>
:nmap <C-w>i :wincmd k<CR>
:nmap <C-w>o :wincmd l<CR>

" Color scheme for gvim
set guifont=Source_Code_Pro:11
set background=dark
hi SpecialKey guifg=#4B7FD3
hi MoreMsg guifg=#5BF385
hi Visual guifg=NONE guibg=NONE
hi Folded ctermbg=4 guibg=#4B7FD3
hi FoldColumn ctermbg=7
hi DiffAdd guibg=#4B7FD3
hi DiffChange guibg=#D99DD0
hi DiffDelete guibg=#61C8C3
hi Normal guifg=Gray guibg=Black
hi Cursor guibg=#191919
hi lCursor guibg=#191919
hi Comment guifg=#61C8C3
hi Constant guifg=#D99DD0
hi Special guifg=#94579D
hi Identifier guifg=#61C8C3
hi Statement guifg=#FFF39D
hi PreProc guifg=#4B7FD3
hi Type guifg=#5BF385
hi Underlined guifg=#4B7FD3
hi Todo guifg=Black
