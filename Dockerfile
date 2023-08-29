FROM mcr.microsoft.com/devcontainers/universal:linux

USER codespace

WORKDIR /workspaces/.codespaces/.persistedshare/dotfiles

COPY . .

RUN ./install.sh

ENTRYPOINT [ "/workspaces/.codespaces/.persistedshare/dotfiles/entrypoint.sh" ]
