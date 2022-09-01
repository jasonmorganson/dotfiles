FROM mcr.microsoft.com/devcontainers/universal:linux

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG USER=codespace

ENV USER=$USER \
    HOME=/home/$USER \

RUN apt-get update && apt-get install sudo
RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --non-unique --uid 1000 --user-group --create-home --home-dir $HOME $USER

FROM base

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .
COPY entrypoint.sh /

RUN ./install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
