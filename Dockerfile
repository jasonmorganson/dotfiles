FROM mcr.microsoft.com/vscode/devcontainers/base:debian AS base

ARG USER=vscode

ENV USER=$USER \
    HOME=/home/$USER \
    HEADLESS=true

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

FROM base

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .

RUN ./install.sh

ENTRYPOINT [ "./entrypoint.sh" ]
