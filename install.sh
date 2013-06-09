#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

include_line="[ -f ${script_dir}/bashrc ] && . ${script_dir}/bashrc"
(grep "${include_line}" ~/.bashrc > /dev/null 2>&1) || (echo "${include_line}" >> ~/.bashrc)

dotfiles=( irbrc screenrc gemrc vimrc gitconfig gitignore_global caprc rspec rvmrc .tmux.conf )
for dotfile in "${dotfiles[@]}"
do
  ln -sf ${script_dir}/${dotfile} ~/.${dotfile}
done
