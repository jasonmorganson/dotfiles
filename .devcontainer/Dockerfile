# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

USER vscode

COPY --chown=vscode:vscode . /tmp/dotfiles

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN,required=true \
    --mount=type=secret,id=GITHUB_USER,env=GITHUB_USER,required=true \
    /tmp/dotfiles/install.sh

WORKDIR /home/vscode
