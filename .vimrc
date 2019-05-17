call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'elixir-editors/vim-elixir'
Plug 'vimwiki/vimwiki'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'chaoren/vim-wordmotion'

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

call plug#end()

set timeoutlen=200

set relativenumber
set ruler

inoremap jk <c-c>`^
inoremap kj <c-c>`^

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

vmap <C-p> y'>p

"First non-blank character
map 0 ^ 

set so=7 "Space under cursor
set ignorecase
set smartcase
syntax enable 
map <space> /
map <c-space> ?
map <F8> gg=G<C-o><C-o>
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
let g:loaded_matchparen=1

set undofile
set undodir=~/.vim/undodir

" Enable filetype plugins
filetype plugin on
filetype indent on

" Fast saving
nmap <leader>w :w!<cr>

" Set to auto read when a file is changed from the outside
set autoread

" vimwiki
set nocompatible

set wildmenu
set showcmd
set cmdheight=2
set laststatus=2

" Yank to end of line
map Y y$

set mouse=a

set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
