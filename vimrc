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

" ctrlp
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_show_hidden = 1

" RSpec runner
let g:drb=0
let g:rspec_cmd="bundle exec rspec"
if !exists("*RunSpec")
  function RunSpec(file)
    if g:drb
      let rspec_args='--drb'
    else
      let rspec_args=''
    endif

    let rspec_current_cmd = g:rspec_cmd . " " . rspec_args . " " . a:file
    let @z = "!echo 'Running " . rspec_current_cmd . "' && " . rspec_current_cmd
    execute @z
  endfunction
endif
map ,t :w<CR>:call RunSpec(expand("%"))<CR>
map ,T :w<CR>:call RunSpec(expand("%") . ":" . line("."))<CR>
map ,r :w<CR>:execute @z<CR>
map <CR> :nohl<CR>

" Copy current file path to clipboard
map ,p :execute "!echo %\|pbcopy"<CR>

" ignore
set wildignore+=*/log/*,*/tmp/*,*.swp,*/spec/vcr_fixtures/*,*/spec/fixtures/vcr_cassettes/*,*/bundle/cache/*,*/node_modules/*

" NerdTree
function OpenNerdTree()
  let curbuf = bufname("%")
  if curbuf != ""
    execute ":NERDTreeFind"
  else
    execute ":NERDTree"
  endif
endfunction
map <c-n> :call OpenNerdTree()<CR>
" let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

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
" set background=light
" colorscheme solarized

" Indentation
filetype indent on
set smartindent


" Browser reload
" https://github.com/mkitt/browser-refresh.vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0
map ,b :RRB<CR>

" Syntax highlighting
au BufNewFile,BufRead *.coffee.erb set filetype=coffee

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Configure syntax highlighting for non-standard extensions
autocmd BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
autocmd BufRead,BufNewFile {.babelrc} set ft=javascript

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <c-g> :Ack "\b<C-R><C-W>\b"<CR>

" vim-javascript
let g:javascript_plugin_jsdoc = 1
