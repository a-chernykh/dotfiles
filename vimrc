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

let g:drb=1
let g:rspec_cmd="bundle exec rspec"
if !exists("*RunSpec")
  function RunSpec(file)
    if g:drb
      let rspec_args='--no-color --drb'
    else
      let rspec_args='--no-color'
    endif

    let @z = "!" . g:rspec_cmd . " " . rspec_args . " " . a:file
    execute @z
  endfunction
endif

map ,t :w<CR>:call RunSpec(expand("%"))<CR>
map ,T :w<CR>:call RunSpec(expand("%") . ":" . line("."))<CR>
map ,r :w<CR>:execute @z<CR>
map <CR> :nohl<CR>

" ignore
set wildignore+=*/log/*,*/tmp/*,*.swp

" NerdTree
map <c-n> :NERDTreeFind<CR>
" let NERDTreeShowHidden=1

" MultiCursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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

" vim-go
let g:go_fmt_command = "goimports"

" Remove trailing spaces on every write
autocmd BufWritePre * :%s/\s\+$//e

set foldmethod=indent
set foldlevel=20

set background=light
colorscheme solarized

" Indentation
filetype indent on
set smartindent

set noswapfile

" Browser reload
" https://github.com/mkitt/browser-refresh.vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0
map <D-r> :RRB<CR>

" Syntax highlighting
au BufNewFile,BufRead *.coffee.erb set filetype=coffee
