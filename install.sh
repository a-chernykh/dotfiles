#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

include_line="[ -f ${script_dir}/bashrc ] && . ${script_dir}/bashrc"
echo $include_line
(grep "${include_line}" ~/.bashrc > /dev/null 2>&1) || (echo "${include_line}" >> ~/.bashrc)

ln -s ${script_dir}/irbrc ~/.irbrc
ln -s ${script_dir}/screenrc ~/.screenrc
ln -s ${script_dir}/gemrc ~/.gemrc
