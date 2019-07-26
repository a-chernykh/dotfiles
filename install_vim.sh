#!/usr/bin/env bash

set -eu

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

ln -sf $(pwd)/vim/spell ~/.vim/spell
ln -sf $(pwd)/vim/ftplugin ~/.vim/ftplugin

PLUGINS=(
  'https://github.com/tpope/vim-sensible'
  'https://github.com/LucHermitte/lh-vim-lib'
  'https://github.com/LucHermitte/local_vimrc'
  'https://github.com/scrooloose/nerdtree'
  'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
  'https://github.com/airblade/vim-gitgutter'
  'https://github.com/mkitt/tabline.vim.git'
  'https://github.com/mileszs/ack.vim.git'
  'https://github.com/morhetz/gruvbox.git'
  'https://github.com/junegunn/fzf'
  'https://github.com/junegunn/fzf.vim.git'

  'https://github.com/fatih/vim-go'
  'https://github.com/kchmck/vim-coffee-script'
  'https://github.com/slim-template/vim-slim'
  'https://github.com/hashivim/vim-terraform.git'
  'https://github.com/pangloss/vim-javascript.git'
  'https://github.com/mxw/vim-jsx.git'
  'https://github.com/tmux-plugins/vim-tmux-focus-events.git'
  'https://github.com/leafgarland/typescript-vim.git'

  'https://github.com/w0rp/ale.git'

  'https://github.com/bkad/CamelCaseMotion.git'

  'https://tpope.io/vim/dispatch.git'
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
