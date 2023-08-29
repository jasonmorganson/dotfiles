FROM mcr.microsoft.com/devcontainers/universal:linux

ARG USER=codespace

ENV USER=$USER \
    HOME=/home/$USER

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .
COPY entrypoint.sh /

RUN ./install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
