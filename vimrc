execute pathogen#infect()

set rtp+=/usr/local/opt/fzf

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
"set relativenumber
set hlsearch
set incsearch
set noswapfile
set foldmethod=indent
set foldlevel=20
set autoread

" remap ESC button
inoremap jj <Esc>

" spellcheck
set spellfile=~/.vim/spell/en.utf-8.add

" Keymaps
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>

" Word movements
" Adds \w \b \e mapping to move through upperCamelCase words
call camelcasemotion#CreateMotionMappings('<leader>')

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Copy current file path to clipboard
map ,p :execute "!echo %\|pbcopy"<CR>

nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" ALE
nnoremap ,l :ALEToggle<CR>
nnoremap ,d :ALEGoToDefinition<CR>
" let g:ale_ruby_solargraph_executable="bin/solargraph"

" Jump to definition in new tab by Ctrl-o
" nnoremap <C-o> <C-w><C-]><C-w>T

" fzf
nnoremap <c-p> :Files<CR>
nnoremap ,m :BTags<CR>
nnoremap ,a :Tags<CR>

" global key mappings
map <CR> :nohl<CR>

" RSpec runner ruby
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
autocmd FileType ruby map ,t :w<CR>:call RunSpec(expand("%"))<CR>
autocmd FileType ruby map ,T :w<CR>:call RunSpec(expand("%") . ":" . line("."))<CR>
autocmd FileType ruby map ,r :w<CR>:execute @z<CR>


" ignore
set wildignore+=*/log/*,*/tmp/*,*.swp,*/spec/vcr_fixtures/*,*/spec/fixtures/vcr_cassettes/*,*/bundle/cache/*,*/node_modules/*
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore log --ignore tmp --ignore spec/vcr_fixtures --ignore spec/fixtures/vcr_cassette --ignore bundle/cache --ignore node_modules -g ""'

" NerdTree
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function OpenNerdTree()
  if IsNERDTreeOpen()
    execute ":NERDTreeClose"
  else
    if @% == ""
      execute ":NERDTreeToggle"
    else
      execute ":NERDTreeFind"
    endif
  endif
endfunction
map <c-n> :call OpenNerdTree()<CR>
" let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 0

" MultiCursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-go golang go
let g:go_fmt_command = "goimports"
let g:go_jump_to_error = 0
autocmd FileType go map ,t :GoTest<CR>
autocmd FileType go map ,T :GoTestFunc<CR>
autocmd FileType go map ,d :GoDef<CR>
autocmd FileType go map ,b :GoBuild<CR>
autocmd FileType go map ,c :!gotags -R . > tags<CR>

" Remove trailing spaces on every write
let leave_spaces_in = [ 'md', 'markdown' ]
autocmd BufWritePre * if index(leave_spaces_in, &ft) < 0 | :%s/\s\+$//e

" Theme
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox

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

" Configure syntax highlighting for non-standard extensions
autocmd BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
autocmd BufRead,BufNewFile {.babelrc} set ft=javascript

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <c-g> :Ack "\b<C-R><C-W>\b"<CR>

" vim-javascript js javascript jsx
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

autocmd FileType javascript map ,c :!ctags --sort=yes --exclude=node_modules --exclude=dist -R .<CR>

autocmd FileType ruby map ,c :!ctags --sort=yes -R --languages=ruby --exclude=.git --exclude=log .<CR>
autocmd FileType ruby map ,C :!ctags --sort=yes -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<CR>
