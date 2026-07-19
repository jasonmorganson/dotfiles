# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup ##

### Run setup script ###
> `curl -L http://morganson.tools | sh`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage ##

`install.sh` is the no-argument setup entrypoint used by Codespaces and similar
environments. Use the generated `mise` wrapper for explicit commands:

> `./mise bootstrap --yes --force-dotfiles`

Regenerate the pinned wrapper with:

> `mise generate bootstrap --version 2026.7.5 --write mise`

See [reference](https://mise.jdx.dev/).

### Docker Compose ###

`docker-compose run dotfiles`
