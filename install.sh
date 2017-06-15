#!/bin/bash

set -eu

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dotfiles=( irbrc screenrc gemrc vimrc gitconfig gitignore_global caprc rspec tmux.conf ackrc )
for dotfile in "${dotfiles[@]}"
do
  ln -sf ${SCRIPT_DIR}/${dotfile} ~/.${dotfile}
done

./install_vim.sh
./install_gems.sh
