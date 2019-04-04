call plug#begin('~/.local/share/nvim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'natebosch/vim-lsc'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'elixir-editors/vim-elixir'
Plug 'vimwiki/vimwiki'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={} 
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips'] 
let g:deoplete#omni#input_patterns={} 
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
call plug#end()

set relativenumber

inoremap jk <Esc>
noremap j h
noremap k j
noremap l k
noremap ; l
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap h <Nop>

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
set backspace=indent,eol,start

set undofile
set undodir=~/.vim/undodir

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" vimwiki
set nocompatible
