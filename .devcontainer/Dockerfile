# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

USER vscode

WORKDIR /tmp/dotfiles

COPY --chown=vscode:vscode . .

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN \
    --mount=type=secret,id=GITHUB_USER,env=GITHUB_USER \
    ./install.sh

WORKDIR /home/vscode
