# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Runs _anywhere_;
- MacOS
- Linux
- Windows (WSL)

Includes:
- ZSH
- BASH
- TMUX
- VIM
- More...

## Requirements ##

Ideally nothing is required to bootstrap with. However, a bare minimum set of tools is needed to at least get the files locally. 

Minimally;
- git
- curl/wget

Most systems come with these pre-installed.

## Setup ##

### Run setup script ###
> `curl -L http://morganson.tools | sh`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage ##

Use [`chezmoi`](https://github.com/twpayne/chezmoi).

See [reference](https://www.chezmoi.io/docs/reference/).

### Docker ###

`docker run jasonmorgason/dotfiles`

### Docker Compose ###

`docker-compose run dotfiles`

## Details ##

### Goals ###
- Minimal
- Simple setup and configuration
- All plugin based so its fully customizable
- Sane defaults and out of the box configuration
- Plug and play with zero config needed to start
- Flexible once in use

## Tips ##
- Prefer asdf installs over brew where possible since the version can be locked

## Contributing ##

- Adhere to XDG when possible
- Don't rely on programs being installed, configs should be flexible and fallback when programs are not installed already