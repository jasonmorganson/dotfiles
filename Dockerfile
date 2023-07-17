FROM mcr.microsoft.com/devcontainers/universal:linux

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG USER=codespace

ENV USER=$USER \
    HOME=/home/$USER

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .
COPY entrypoint.sh /

RUN ./install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
