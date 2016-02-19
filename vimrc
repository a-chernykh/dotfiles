execute pathogen#infect()

" General settings
syntax on
set nocompatible
set ruler
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set number
set numberwidth=5
set hlsearch
set incsearch
set noswapfile
set foldmethod=indent
set foldlevel=20

" Keymaps
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" RSpec runner
let g:drb=1
let g:rspec_cmd="bundle exec rspec"
if !exists("*RunSpec")
  function RunSpec(file)
    if g:drb
      let rspec_args='--drb'
    else
      let rspec_args=''
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
set wildignore+=*/log/*,*/tmp/*,*.swp,*/spec/vcr_fixtures/*,*/spec/fixtures/vcr_cassettes/*

" NerdTree
map <c-n> :NERDTreeFind<CR>
" let NERDTreeShowHidden=1

" MultiCursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-go
let g:go_fmt_command = "goimports"

" Remove trailing spaces on every write
autocmd BufWritePre * :%s/\s\+$//e

" Theme
set background=light
colorscheme solarized

" Indentation
filetype indent on
set smartindent


" Browser reload
" https://github.com/mkitt/browser-refresh.vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0
map <D-r> :RRB<CR>

" Syntax highlighting
au BufNewFile,BufRead *.coffee.erb set filetype=coffee

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

