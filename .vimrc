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
set number
set spelllang=en_us
set nospell
set mouse=a

filetype plugin indent on
augroup vimrcEx
au!
"autocmd FileType cpp setlocal sw=2 ts=2 tw=80 et
autocmd FileType haskell setlocal sw=4 ts=4 tw=78 et
autocmd FileType html setlocal et sw=2 ts=2 tw=78
autocmd FileType javascript setlocal cindent et sw=2 ts=2 tw=78
autocmd FileType python setlocal ai sw=4 ts=4 et
autocmd FileType ruby setlocal sw=2 ts=2 et
autocmd FileType text setlocal tw=70
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Select a block of text and auto-fill to textwidth.
map Q gq
syntax on
colo molokai
