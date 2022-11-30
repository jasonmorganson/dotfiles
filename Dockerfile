FROM mcr.microsoft.com/vscode/devcontainers/base:debian AS base

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG USER=vscode

ENV USER=$USER \
    HOME=/home/$USER \
    HEADLESS=true

USER $USER

WORKDIR $HOME

COPY --chown=$USER . /home/dotfiles
COPY entrypoint.sh /

# RUN /home/dotfiles/install.sh
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/home/linuxbrew /home/dotfiles/install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
