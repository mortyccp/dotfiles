let g:is_posix=1

call plug#begin('~/.vim/plugged')

" languages
Plug 'fatih/vim-go'

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
let g:ale_lint_on_text_changed='never'

" style
set laststatus=2
set list listchars=tab:>-,trail:.
set number
set ruler

" command completion
set wildmenu
set wildmode=longest:full,full

" responsiveness
set lazyredraw

" editing
set autoindent
set autoread
set backspace=indent,eol,start
" force vim not to rename when saving file
" since renaming may break some file wathcing programs e.g. webpack
set backupcopy=yes
set hidden
set noswapfile
set scrolloff=5
set nofoldenable

" indentation
set expandtab shiftwidth=2 softtabstop=2

" clipboard
set clipboard+=unnamed

" mouse
set mouse=a

" search
set hlsearch
set ignorecase smartcase
set incsearch

" split
set splitbelow
set splitright

" completion
set completeopt-=preview

" mapping
let mapleader = "\<Space>"
nnoremap <Leader><Leader> :set hlsearch!<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" additional file types
augroup AdditionalFileTypes
  autocmd!
  autocmd BufRead,BufNewFile Podfile,*.podspec set filetype=ruby
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
augroup END

" file type extras
augroup Indentation
  autocmd!
  autocmd FileType
        \ go
        \ setlocal noexpandtab nolist shiftwidth=4 tabstop=4
  autocmd FileType
        \ java
        \ setlocal expandtab nolist shiftwidth=4 tabstop=4
  autocmd FileType
        \ gitcommit,text,markdown
        \ setlocal spell spelllang=en_us
augroup END
