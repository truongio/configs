call plug#begin('~/.local/share/nvim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'natebosch/vim-lsc'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'elixir-editors/vim-elixir'

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
set ruler

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
set wrap "Wrap lines
set ai "Auto indent
set si "Smart indent

set undofile
set undodir=~/.vim/undodir

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:loaded_matchparen=1

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
