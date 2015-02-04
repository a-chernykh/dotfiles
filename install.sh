#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INCLUDE_LINE="[ -f ${SCRIPT_DIR}/bashrc ] && . ${SCRIPT_DIR}/bashrc"
(grep "${INCLUDE_LINE}" ~/.bashrc > /dev/null 2>&1) || (echo "${INCLUDE_LINE}" >> ~/.bashrc)

dotfiles=( irbrc screenrc gemrc vimrc gitconfig gitignore_global caprc rspec rvmrc tmux.conf )
for dotfile in "${dotfiles[@]}"
do
  ln -sf ${SCRIPT_DIR}/${dotfile} ~/.${dotfile}
done

SUBLIME_CONFIG_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
if [ -d "$SUBLIME_CONFIG_DIR" ]; then
  ln -sf "$SCRIPT_DIR/sublime/Package Control.sublime-settings" "$SUBLIME_CONFIG_DIR/Package Control.sublime-settings"
  ln -sf "$SCRIPT_DIR/sublime/Preferences.sublime-settings" "$SUBLIME_CONFIG_DIR/Preferences.sublime-settings"
fi
