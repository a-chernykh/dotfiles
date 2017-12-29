#!/usr/bin/env bash

set -eu

brew update

PACKAGES=(
  ack
  awscli
  blackbox
  csshx
  ctags
  ctop
  direnv
  fzf
  git
  gnupg
  go
  gotags
  gradle
  grep
  htop
  hub
  imagemagick
  jq
  maven
  mysql
  nvm
  openssl
  pidof
  pssh
  rbenv
  ruby-build
  thefuck
  tmux
  tree
  vim
  watch
  wget
  yarn
  zsh
)

for package in ${PACKAGES[@]}; do
  brew install ${package}
done
