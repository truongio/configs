call plug#begin('~/.local/share/nvim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'natebosch/vim-lsc'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }

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
inoremap jj <Esc>
noremap j h
noremap k j
noremap l k
noremap ö l
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap h <Nop>
set so=7
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
syntax enable 
map <space> /
map <c-space> ?
map 0 ^
map <F8> gg=G<C-o><C-o>
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set undofile
set undodir=~/.vim/undodir
