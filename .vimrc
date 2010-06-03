" ~/.vimrc
" Andrew Antle - http://antlechrist.org/

set nocompatible
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set history=50
set ruler
set showcmd
set hlsearch
set incsearch
set listchars=tab:>-
set list
set noexpandtab
set nonumber
set spelllang=en_us
set nospell
set mouse=a

filetype plugin indent on
augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
autocmd FileType haskell setlocal tw=78 ts=4 sw=4 et
autocmd FileType html setlocal ts=2 sw=2 et
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Select a block of text and auto-fill to textwidth.
map Q gq
syntax on
