# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

USER vscode
ENV PATH="/home/vscode/.local/bin:${PATH}"

COPY --chown=vscode:vscode . /home/vscode/.local/share/dotfiles

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN,required=true \
    --mount=type=secret,id=GITHUB_USER,env=GITHUB_USER,required=true \
    /home/vscode/.local/share/dotfiles/install.sh

WORKDIR /home/vscode
