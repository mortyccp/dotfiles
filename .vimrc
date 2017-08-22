call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

" fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif

" git integration
Plug 'airblade/vim-gitgutter'

call plug#end()

let g:gitgutter_sign_column_always=1
set updatetime=250

" style
set colorcolumn=80
set number
set ruler
set showcmd
set wildmenu
set laststatus=2
set cursorline
set list listchars=tab:>-,trail:.
set background=dark
syntax enable
colorscheme solarized

" editing
set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set hidden
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set scrolloff=10
set ttimeout
set ttimeoutlen=100
set noswapfile

" clipboard
set clipboard=unnamed,unnamedplus

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" mouse
set mouse=a

" key
let mapleader = "\<Space>"
nnoremap <Leader><Leader> :set hlsearch!<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

