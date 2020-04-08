# dotfiles

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Setup ##

### Run setup script ###
> `curl -sL https://git.io/JvxiQ | sh`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)
```bash
#!/bin/sh

# Install chezmoi
curl -sfL https://git.io/chezmoi | sh

# Init chezmoi
./bin/chezmoi init --apply https://github.com/jasonmorganson/dotfiles.git
```

## Usage ##

Use [`chezmoi`](https://github.com/twpayne/chezmoi).

See [reference](https://www.chezmoi.io/docs/reference/).
