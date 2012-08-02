#!/bin/bash

include_line="[ -f ~/dotfiles/bashrc ] && . ~/dotfiles/bashrc"
grep '$include_line' ~/.bashrc || echo '$include_line' >> ~/.bashrc

ln -s ~/dotfiles/irbrc ~/.irbrc
ln -s ~/dotfiles/screenrc ~/.screenrc
ln -s ~/dotfiles/.gemrc ~/.gemrc
