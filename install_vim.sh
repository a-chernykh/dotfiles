#!/bin/sh

set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

[ -d ~/.vim/bundle/vim-sensible ] || git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
[ -d ~/.vim/bundle/ctrlp.vim ] || git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
[ -d ~/.vim/bundle/ctrlp-cmatcher ] || git clone https://github.com/JazzCore/ctrlp-cmatcher ~/.vim/bundle/ctrlp-cmatcher
[ -d ~/.vim/bundle/nerdtree ] || git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
[ -d ~/.vim/bundle/vim-multiple-cursors ] || git clone https://github.com/terryma/vim-multiple-cursors ~/.vim/bundle/vim-multiple-cursors
[ -d ~/.vim/bundle/vim-go ] || git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
[ -d ~/.vim/bundle/vim-colors-solarized ] || git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
[ -d ~/.vim/bundle/vim-coffee-script ] || git clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script

# Support for local vim configuration (_vimrc_local.vim)
[ -d ~/.vim/bundle/lh-vim-lib ] || git clone git@github.com:LucHermitte/lh-vim-lib.git ~/.vim/bundle/lh-vim-lib
[ -d ~/.vim/bundle/local_vimrc ] || git clone git@github.com:LucHermitte/local_vimrc.git ~/.vim/bundle/local_vimrc
