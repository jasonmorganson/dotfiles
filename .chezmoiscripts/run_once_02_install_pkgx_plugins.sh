#!/bin/sh
set -eu

# Install pkgx plugins
pkgx install cli.github.com^2.26
pkgx install crates.io/git-delta^0.15
pkgx install crates.io/gitui@latest
pkgx install crates.io/ripgrep@latest
pkgx install crates.io/vivid^0.9
pkgx install crates.io/zellij~0.38
pkgx install git-scm.org^2.40
pkgx install github.com/junegunn/fzf@latest
pkgx install github.com/peltoche/lsd^1
pkgx install helix-editor.com~23.10
pkgx install nushell.sh~0.86
pkgx install starship.rs~1.16

