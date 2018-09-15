#!/usr/bin/env bash

set -eux

# source ~/.nix-profile/etc/profile.d/nix.sh

nix-env -i jq glibc-locales httpie

nix-collect-garbage -d