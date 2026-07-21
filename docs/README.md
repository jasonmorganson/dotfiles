# dotfiles

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

Bootstrap a new machine without GitHub authentication, providing the GitHub
username whose public profile and SSH keys should be used:

```sh
curl -fsSL https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d/raw/setup.sh | GITHUB_USER=your-github-user sh
```

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage

Pull the latest dotfiles and reapply the machine configuration:

```sh
bootstrap
```

`install.sh` is the no-argument setup entrypoint used by Codespaces and similar
environments. It installs `mise` to `/usr/local/bin` before bootstrapping:

> `mise bootstrap --yes --force-dotfiles`

See [reference](https://mise.jdx.dev/).
