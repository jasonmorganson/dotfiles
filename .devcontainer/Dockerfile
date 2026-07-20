# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN curl -fsSL https://mise.run | \
    MISE_VERSION=v2026.7.5 MISE_INSTALL_PATH=/usr/local/bin/mise sh

USER vscode

COPY --chown=vscode:vscode . /tmp/dotfiles

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN,required=true \
    /tmp/dotfiles/install.sh

WORKDIR /home/vscode
