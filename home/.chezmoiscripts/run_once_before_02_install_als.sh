#!/bin/sh
set -eu

# Install alias-rs
pkgx cargo install --git https://github.com/nomyfan/alias-rs
# sudo pkgx cargo install --git https://github.com/nomyfan/alias-rs --root /usr/local