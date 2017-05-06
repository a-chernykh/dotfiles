#!/bin/sh

set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

PLUGINS=(
  'https://github.com/tpope/vim-sensible'
  'https://github.com/kien/ctrlp.vim'
  'https://github.com/JazzCore/ctrlp-cmatcher'
  'https://github.com/scrooloose/nerdtree'
  'https://github.com/terryma/vim-multiple-cursors'
  'https://github.com/fatih/vim-go'
  'https://github.com/altercation/vim-colors-solarized'
  'https://github.com/kchmck/vim-coffee-script'
  'https://github.com/LucHermitte/lh-vim-lib'
  'https://github.com/LucHermitte/local_vimrc'
  'https://github.com/mkitt/browser-refresh.vim'
  'https://github.com/slim-template/vim-slim'
  'https://github.com/airblade/vim-gitgutter'
  'https://github.com/mkitt/tabline.vim.git'
  'https://github.com/hashivim/vim-terraform.git'
  'https://github.com/mileszs/ack.vim.git'
  'https://github.com/pangloss/vim-javascript.git'
)

for url in ${PLUGINS[@]}; do
  plugin=$(basename $url)
  dir="$HOME/.vim/bundle/$plugin"

  if [ -d $dir ]; then
    echo "Skipping $plugin"
  else
    echo "Installing $plugin"
    git clone $url $dir
  fi
done
