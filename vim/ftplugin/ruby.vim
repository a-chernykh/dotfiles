" RSpec runner ruby
map <buffer> ,t :w<CR>:call RunSpec(expand("%"))<CR>
map <buffer> ,T :w<CR>:call RunSpec(expand("%") . ":" . line("."))<CR>

" Generate ctags
map <buffer> ,c :!ctags --sort=yes -R --languages=ruby --exclude=.git --exclude=log .<CR>
map <buffer> ,C :!ctags --sort=yes -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<CR>
