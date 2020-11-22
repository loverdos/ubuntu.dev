#!/usr/bin/env bash

set -euxo pipefail

# install: python
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt install -y golang-go

sudo apt-get autoremove -y
sudo apt-get autoclean -y

GOPATH=~/go
mkdir -p $GOPATH

go get github.com/jessfraz/udict
go get github.com/jesseduffield/lazygit
go get github.com/fiatjaf/jiq/cmd/jiq

rm -rf $GOPATH/src/
