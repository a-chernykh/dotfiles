#!/usr/bin/env bash

set -eu

mkdir -p ~/bin
cp -f refresh-docker-token.sh ~/bin
cp -f com.andrey.refresh_docker_token.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/com.andrey.refresh_docker_token.plist
