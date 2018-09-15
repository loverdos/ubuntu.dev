#!/usr/bin/env bash

set -eux

curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh | sh

~/.linuxbrew/bin/brew install wtf youtube-dl fzy

rm -rf ~/.cache/Homebrew