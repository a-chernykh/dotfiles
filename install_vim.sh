#!/bin/sh

set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

[ -d ~/.vim/bundle/vim-sensible ] || git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
[ -d ~/.vim/bundle/ctrlp.vim ] || git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
[ -d ~/.vim/bundle/ctrlp-cmatcher ] || git clone https://github.com/JazzCore/ctrlp-cmatcher ~/.vim/bundle/ctrlp-cmatcher
[ -d ~/.vim/bundle/nerdtree ] || git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
