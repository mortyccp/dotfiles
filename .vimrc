unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')

" languages
Plug 'elixir-lang/vim-elixir'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'reasonml-editor/vim-reason'

" colorscheme
Plug 'altercation/vim-colors-solarized'

" fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif

call plug#end()

" mxw/vim-jsx
let g:jsx_ext_required = 0

" style
set number
set laststatus=2
set cursorline
set list listchars=tab:>-,trail:.
syntax enable
set background=dark
colorscheme solarized

" editing
set autoindent
set autoread
set encoding=utf-8
set hidden
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set noswapfile
set backupcopy=yes

" key
let mapleader = "\<Space>"

" clipboard
set clipboard=unnamed,unnamedplus

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <Leader><Leader> :set hlsearch!<CR>

" navigation
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" split
set splitbelow
set splitright

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" completion
set completeopt-=preview

" command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" filetypes
au FileType javascript,json,ruby,sh setlocal expandtab shiftwidth=2 softtabstop=2
au FileType py setlocal expandtab autoindent tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79

" go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
au FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 nolist autowrite
au FileType go nmap <Leader>c :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>i <Plug>(go-info)
