unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')

" languages
Plug 'elixir-lang/vim-elixir'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Vimjas/vim-python-pep8-indent'

" colorscheme
Plug 'altercation/vim-colors-solarized'

" fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif

call plug#end()

" style
set number
set laststatus=2
set cursorline
set list listchars=tab:>-,trail:.
" colorscheme solarized
syntax enable
set background=dark
colorscheme solarized

" editing
set autoindent
set autoread
set encoding=utf-8
set hidden
set smarttab
set noswapfile
set backupcopy=yes

" clipboard
set clipboard=unnamed,unnamedplus

" search
set ignorecase
set smartcase
set hlsearch

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

" indentation
autocmd FileType javascript,json,ruby,sh setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType py setlocal expandtab autoindent tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
