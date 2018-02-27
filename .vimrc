let g:is_posix=1

call plug#begin('~/.vim/plugged')

" fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif

" lint
Plug 'w0rp/ale'

call plug#end()

" ALE
let g:ale_fix_on_save=1
let g:ale_fixers={}
let g:ale_fixers['go']=['gofmt', 'goimports']
let g:ale_fixers['javascript']=['prettier']
let g:ale_fixers['typescript']=['prettier']
let g:ale_javascript_prettier_use_local_config=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_text_changed='never'

" style
set laststatus=2
set list listchars=tab:>-,trail:.
set number
set ruler
set showcmd
set ttimeout ttimeoutlen=100
set wildmenu

" responsiveness
set lazyredraw
set synmaxcol=120

" editing
set autoindent
set autoread
set backspace=indent,eol,start
set backupcopy=yes
set encoding=utf-8
set hidden
set noswapfile
set scrolloff=5

" clipboard
set clipboard=unnamed

" mouse
set mouse=a

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" split
set splitbelow
set splitright

" completion
set completeopt-=preview

" mapping
nnoremap Y y$
nnoremap <Space><Space> :set hlsearch!<CR>
nnoremap <Space>f :Files<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" file types
augroup MyFileType
  autocmd!
  autocmd BufRead,BufNewFile Podfile,*.podspec set filetype=ruby
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
augroup END

" indentation
augroup MyIndentation
  autocmd!
  autocmd FileType
    \ go
    \ setlocal noexpandtab shiftwidth=4 tabstop=4
  autocmd FileType
    \ css,vim,html,javascript,json,ruby,sh,yaml
    \ setlocal expandtab shiftwidth=2 softtabstop=2
augroup END
