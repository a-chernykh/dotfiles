#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INCLUDE_LINE="[ -f ${SCRIPT_DIR}/bashrc ] && . ${SCRIPT_DIR}/bashrc"
(grep "${INCLUDE_LINE}" ~/.bashrc > /dev/null 2>&1) || (echo "${INCLUDE_LINE}" >> ~/.bashrc)

dotfiles=( irbrc screenrc gemrc vimrc gitconfig gitignore_global caprc rspec tmux.conf )
for dotfile in "${dotfiles[@]}"
do
  ln -sf ${SCRIPT_DIR}/${dotfile} ~/.${dotfile}
done

install_sublime.sh
install_vim.sh
