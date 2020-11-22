#!/usr/bin/env bash

set -euxo pipefail

sudo -E apt install -y ncdu graphviz atool p7zip-full zip unzip fzy silversearcher-ag darcs mercurial base58 rlwrap openssl libssl-dev build-essential make cmake autoconf libtool m4 zlib1g gcc g++ llvm libclang-dev libreadline-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev libncurses5-dev libncursesw5-dev libevent-dev libgmp-dev libzmq3-dev git-buildpackage libsnappy-dev xsel libx11-xcb1 libfontconfig libgl1 libxrender1 libxcomposite1 libqt5gui5 libasound2 libpulse0 libxcursor1 libxinerama1 libxi6 libxrandr2 libxxf86vm1 libwayland-egl1-mesa libwayland-cursor0 libxkbcommon0 postgresql-common postgresql-server-dev-all mysql-client libmysqlclient-dev


sudo apt-get autoremove -y
sudo apt-get autoclean -y
