"
" ~/.vimrc
"
" Andrew Antle - http://antlechrist.org/
"

"
" If we're on the console set it to 16 colors. Otherwise set it to 256 colors.
"
"if &term=="linux"
"  set t_Co=16
"else
"  set t_Co=256
"endif

set nocompatible
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set history=50
set ruler
set showcmd
set incsearch

"
" Select a block of text and auto-fill to textwidth.
"
map Q gq

if has('mouse')
  set mouse=a
endif
syntax on
colorscheme default
set hlsearch

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType haskell setlocal tw=79 ts=2 sw=2 et
  autocmd FileType html setlocal ts=2 sw=2 et
  autocmd BufReadPost * " Remember where we left off in the file.
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent
  set smartindent
  set cindent
endif

set noexpandtab
set listchars=tab:>-
set list
set nonumber
set spelllang=en_us
set nospell
