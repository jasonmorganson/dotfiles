# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Runs _anywhere_;

- MacOS
- Linux
- Windows (WSL)
- Docker
- Docker Compose
- devcontainer
- Codespaces
- [gitpod](https://gitpod.io/)
- [Coder](https://coder.com/)

Includes:

- ZSH
- BASH
- TMUX
- VIM
- More...

## Requirements

Ideally nothing is required to bootstrap with. However, a bare minimum set of tools is needed to at least get the files locally.

Minimally;

- git
- curl/wget

Most systems come with these pre-installed.

## Setup

### Run setup script

> `curl -L http://morganson.tools | sh`

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

## Usage

Use [`chezmoi`](https://github.com/twpayne/chezmoi).

See [reference](https://www.chezmoi.io/docs/reference/).

## Details

### Goals

- All plugin based so its fully customizable
- Sane defaults and out of the box configuration
- Plug and play with zero config needed to start
- Flexible once in use

## How

Any prerequisites are installed to support all supported software. This makes for a larger install, but provides out of the box support.

The main installation driver is asdf. It locks versions which ensures consistency.

Brew is used as a backstop for anything not available in asdf. There are many packages already available.

Everything is plugin driven.

## Building

### Docker

`docker build .`

### Docker Compose

`docker compose build`

## Running

### Docker

`docker run $USER/dotfiles`

### Docker Compose

`docker compose run run`

### Google Cloud VM

`gcloud compute instances create-with-container $USER --container-image $USER/dotfiles`

## Stack

Lists are in order of personal preference.

### Distributions

| Name          |            Support |
| ------------- | -----------------: |
| MacOS         | :white_check_mark: |
| Debian        | :white_check_mark: |
| Ubuntu        | :white_check_mark: |
| Windows (WSL) | :white_check_mark: |

### Hosts

| Name           |                           Support |
| -------------- | --------------------------------: |
| Codespaces     |                :white_check_mark: |
| devcontainer   |                :white_check_mark: |
| Coder          | :clipboard::small_orange_diamond: |
| gitpod         |                :white_check_mark: |
| Docker Compose |                :white_check_mark: |
| Docker         |                :white_check_mark: |

### Terminals

| Name           |                            Support |
| -------------- | ---------------------------------: |
| Alacritty      |                        :clipboard: |
| Kitty          | :raised_hand_with_fingers_splayed: |
| Hyper          |                        :clipboard: |
| iTerm          | :raised_hand_with_fingers_splayed: |
| MacOS Terminal |                        :clipboard: |

### Multiplexers

| Name   |            Support |
| ------ | -----------------: |
| Zellij |        :clipboard: |
| tmux   | :white_check_mark: |

### Shells

| Name    |                            Support |
| ------- | ---------------------------------: |
| NuShell | :raised_hand_with_fingers_splayed: |
| zsh     |                 :white_check_mark: |
| bash    |                 :white_check_mark: |
| fish    |                       :red_circle: |
| elvish  |                       :red_circle: |
|         |                                    |

### Commands

| Name | Preference |
| ---- | ---------- |
| cat  | bat        |
| Diff |            |

## Recommended Stack

|           |
| --------- |
| MacOS     |
| Allacrity |
| Zellij    |
| NuShell   |

## Rust

### Stack

Alacritty -> Zellij -> NuShell -> Sheldon + Starship -> ?

## Tips

- Prefer asdf installs over brew where possible since the version can be locked

## Contributing

- Adhere to XDG when possible
- Don't rely on programs being installed
  - Configs should be flexible and fallback when programs are not installed already

# XDG

| Application | Support                | Notes                                                                                               |
| ----------- | :--------------------- | --------------------------------------------------------------------------------------------------- |
| vim         | :construction:         |                                                                                                     |
| bash        | :stop_sign:            | Bash [won't fix XDG support](https://savannah.gnu.org/support/?108134).                             |
| git         | :white_check_mark:     |                                                                                                     |
| Zsh         | :small_orange_diamond: | Partially supported due to [bootstrap problem](https://www.zsh.org/mla/workers/2013/msg00692.html). |
| foo         | :clipboard:            |                                                                                                     |
|             |                        |                                                                                                     |
| Bar         | :stop_sign:            |                                                                                                     |

:clipboard: - TODO

:raised_hand_with_fingers_splayed: - Open

:construction: - Unfinished

:red_circle: - Unsupported

:stop_sign: - Blocked

:small_orange_diamond: - Partial Support

:white_check_mark: - Supported

### Exceptions

#### Shells

##### Files

- `.profile`
  - Sourced by many shells
  - TODO: Load plugins

#### Bash

##### Files

- `.bashrc`
  - Loads the profile in a non-login shell
  - Hooks direnv into the shell (TODO: Move to plugin)

#### zsh

##### Files

- `.zshenv`
  - Loads the profile
  - Sets ZDOTDIR (TODO: Move to plugin)



