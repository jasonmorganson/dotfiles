FROM mcr.microsoft.com/vscode/devcontainers/base:debian AS base

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

FROM base AS cache

ARG USER=vscode

FROM cache

ENV USER=$USER \
    HOME=/home/$USER \
    HEADLESS=true

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .
COPY entrypoint.sh /

RUN ./install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
