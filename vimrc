"~/.vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on
:Helptags

set ignorecase		" Do case insensitive matching
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
filetype plugin indent on

let g:black_virtualenv="~/.vim/black"

autocmd BufWritePost *.py call flake8#Flake8()
