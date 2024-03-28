FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER vscode

WORKDIR /workspace

COPY . .

RUN ./install.sh

