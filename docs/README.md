# dotfiles

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup ##

### Run setup script ###
> `curl -sL https://git.io/JJif9 | sh`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage ##

`install.sh` is the no-argument setup entrypoint used by Codespaces and similar
environments. It installs `mise` to `/usr/local/bin` before bootstrapping:

> `mise bootstrap --yes --force-dotfiles`

See [reference](https://mise.jdx.dev/).
