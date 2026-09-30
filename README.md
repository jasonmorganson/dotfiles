# dotfiles

Dotfiles, bootstrapped and managed with [`mise`](https://mise.jdx.dev/).

## Install

```sh
curl -fsSL https://install.morganson.me | sh
```

## Update

```sh
dotfiles
```

[Read the full documentation](https://dotfiles.morganson.me/)

## Codex configuration

Codex owns `~/.codex/config.toml`, its installed plugins, and its application state.
This repository only creates the `~/.codex` directory. Bootstrap and update tasks
must not copy, template, symlink, or modify files inside it, or set `CODEX_HOME`.
Manage Codex settings through Codex or its global configuration file so dotfiles
updates cannot restore deprecated settings or overwrite application changes.
