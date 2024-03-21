FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER vscode

WORKDIR /home/vscode

COPY . .

RUN ./install.sh

ENTRYPOINT [ "/home/vscode/entrypoint.sh" ]
