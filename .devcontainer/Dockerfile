# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
    libncurses-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

USER vscode

WORKDIR /home/vscode

COPY . .

RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN \
    --mount=type=secret,id=GITHUB_USER,env=GITHUB_USER \
    ./install.sh
