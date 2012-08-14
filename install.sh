#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

include_line="[ -f ${script_dir}/bashrc ] && . ${script_dir}/bashrc"
(grep "${include_line}" ~/.bashrc > /dev/null 2>&1) || (echo "${include_line}" >> ~/.bashrc)

ln -s ${script_dir}/irbrc ~/.irbrc
ln -s ${script_dir}/screenrc ~/.screenrc
ln -s ${script_dir}/gemrc ~/.gemrc
ln -s ${script_dir}/vimrc ~/.vimrc
ln -s ${script_dir}/gitconfig ~/.gitconfig
ln -s ${script_dir}/gitignore ~/.gitignore_global
ln -s ${script_dir}/caprc ~/.caprc
ln -s ${script_dir}/rspec ~/.rspec
