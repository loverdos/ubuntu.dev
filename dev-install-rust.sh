#!/usr/bin/env bash

set -euxo pipefail

sudo bash -c '
  apt install -y pkg-config && apt-get autoremove -y && apt-get autoclean -y
'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

~/.cargo/bin/rustup target add x86_64-unknown-linux-musl wasm32-unknown-unknown wasm32-wasi x86_64-apple-darwin riscv64gc-unknown-linux-gnu x86_64-pc-windows-gnu x86_64-pc-windows-msvc

~/.cargo/bin/cargo install exa starship mdbook
