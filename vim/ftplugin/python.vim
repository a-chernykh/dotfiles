let b:ale_linters = ['flake8', 'pyls']
let b:ale_fixers = ['autopep8']

map <buffer> ,r :w<CR>:!python %<CR>
