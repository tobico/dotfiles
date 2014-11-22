execute pathogen#infect()
syntax on
filetype plugin indent on

" Line numbering
set number
highlight LineNr ctermfg=Black ctermbg=Magenta

" Right margins
set cc=78,80,100,120

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

" Always show status line
set laststatus=2

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

set guifont=Source\ Code\ Pro\ Medium\ 11

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

colorscheme custom
let macvim_skip_colorscheme = 1
