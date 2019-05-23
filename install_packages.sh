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
  cmake
  direnv
  fzf
  git
  gnupg
  go
  gotags
  gradle
  graphviz
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
  protobuf
  rbenv
  redis
  ruby-build
  sqlite
  telnet
  thefuck
  tmux
  tree
  vim
  unrar
  watch
  wget
  yarn
  zsh
)

for package in ${PACKAGES[@]}; do
  brew install ${package}
done
