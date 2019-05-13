" make syntax/sh.vim need not to guess shell script type
let g:is_posix=1

" ALE
let g:ale_fix_on_save=1
let g:ale_fixers={}
let g:ale_fixers['shell']=['shellcheck']
let g:ale_fixers['go']=['gofmt']
let g:ale_fixers['rust']=['rustfmt']
let g:ale_fixers['javascript']=['prettier']
let g:ale_fixers['typescript']=['prettier']
let g:ale_fixers['css']=['prettier']
let g:ale_fixers['scss']=['prettier']
let g:ale_lint_on_text_changed='never'
let g:ale_linters={}
let g:ale_linters['typescript']=['tsserver', 'tslint']
let g:ale_linters['go']=['golangserver', 'golint']
let g:ale_completion_enabled=1

" Activate plugins in other locations
set runtimepath+=/usr/local/opt/fzf

" Activate plugins distributed with vim
packadd! matchit

" Declare plugins
if exists('*packager#init')
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
  call packager#add('w0rp/ale')
  call packager#add('junegunn/fzf')
  call packager#add('junegunn/fzf.vim')
  call packager#add('tpope/vim-sleuth')
  call packager#add('dracula/vim')
endif

command! -bang PackUpdate packadd vim-packager | source $MYVIMRC | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean packadd vim-packager | source $MYVIMRC | call packager#clean()
command! PackStatus packadd vim-packager | source $MYVIMRC | call packager#status()

filetype on
filetype plugin on

" Look
set laststatus=2 number relativenumber ruler
set list listchars=tab:>-,trail:~
" According to :h xterm-true-color
" t_8f and t_8b are only set when $TERM is xterm*
" In tmux, $TERM is screen by default.
" Therefore, we have to set them explicitly here.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
syntax on
silent! colorscheme dracula

" Command completion
set wildmenu wildmode=longest:full,full

" Responsiveness
set lazyredraw

" Editing
set autoread
set autoindent
set backspace=indent,eol,start
" Force vim not to rename when saving a file
" since renaming may break some file watching programs e.g. webpack
set backupcopy=yes
set hidden
set noswapfile
set scrolloff=5
set nofoldenable
set clipboard+=unnamed
set mouse=a
" Make escape sequence timeout faster
" e.g. <Esc>O (Return to normal mode and then press O)
set timeout ttimeout timeoutlen=3000 ttimeoutlen=100

" Search
set ignorecase smartcase
set incsearch

" Mapping
let mapleader=' '
nnoremap Y y$
nnoremap <Space> <Nop>
nnoremap <Leader><Space> :set hlsearch!<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" Commands
command! -nargs=1 Spaces execute "setlocal tabstop=" . <args> . " shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab"
command! -nargs=1 Tabs   execute "setlocal tabstop=" . <args> . " shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab"

" File type extras
augroup MyFileTypeExtras
  autocmd!
  autocmd BufRead,BufNewFile *ts,*.tsx set filetype=typescript
  autocmd FileType go setlocal nolist
  autocmd FileType gitcommit,text,markdown setlocal spell spelllang=en_us
augroup END
