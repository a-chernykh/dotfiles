execute pathogen#infect()

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <D-1> 1gt
inoremap <D-1> <C-O>1gt

map <D-2> 2gt
inoremap <D-2> <C-O>2gt

map <D-3> 3gt
inoremap <D-3> <C-O>3gt

map <D-4> 4gt
inoremap <D-4> <C-O>4gt

map <D-5> 5gt
inoremap <D-5> <C-O>5gt

map <D-6> 6gt
inoremap <D-6> <C-O>6gt

map <D-7> 7gt
inoremap <D-7> <C-O>7gt

map <D-8> 8gt
inoremap <D-8> <C-O>8gt

map <D-9> 9gt
inoremap <D-9> <C-O>9gt

map ,t :w<CR>:!bundle exec rspec --no-color --drb %<CR>
map ,T :w<CR>:exec("!bundle exec rspec --no-color --drb "  . expand("%") . ":" . line("."))<CR>

map <c-n> :NERDTreeFind<CR>

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
