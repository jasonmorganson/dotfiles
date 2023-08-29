FROM mcr.microsoft.com/devcontainers/universal:linux

ARG USER=codespace

ENV USER=$USER \
    HOME=/home/$USER

USER $USER

WORKDIR /workspaces/.codespaces/.persistedshare/dotfiles

COPY --chown=$USER . .

RUN ./install.sh

ENTRYPOINT [ "/workspaces/.codespaces/.persistedshare/dotfiles/entrypoint.sh" ]
