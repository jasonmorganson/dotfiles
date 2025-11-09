# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Setup ##

### Run setup script ###

- macOS / Linux  
  `curl -L http://morganson.tools | sh`
- Windows (PowerShell 5+)  
  `Set-ExecutionPolicy Bypass -Scope Process -Force; iex "& { $(irm https://raw.githubusercontent.com/jasonmorganson/dotfiles/main/install.ps1) }"`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage ##

Use [`chezmoi`](https://github.com/twpayne/chezmoi).

See [reference](https://www.chezmoi.io/docs/reference/).

### Docker Compose ###

`docker-compose run dotfiles`
