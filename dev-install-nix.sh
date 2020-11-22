#!/usr/bin/env bash

set -eux

curl -L https://nixos.org/nix/install | sh

source ~/.nix-profile/etc/profile.d/nix.sh

nix-env -i jq glibc-locales jq tig

nix-collect-garbage -d