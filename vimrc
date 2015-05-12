execute pathogen#infect()

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

map ,t :w<CR>:!bundle exec rspec --no-color --drb %<CR>
map ,T :w<CR>:exec("!bundle exec rspec --no-color --drb "  . expand("%") . ":" . line("."))<CR>

set nocompatible

set ruler
syntax on
set nowrap

set tabstop=2
set shiftwidth=2
set expandtab

set number
set numberwidth=5

set hlsearch
set incsearch
