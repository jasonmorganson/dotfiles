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

COPY --chown=$USER . /home/dotfiles
COPY entrypoint.sh /

# RUN /home/dotfiles/install.sh
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/home/linuxbrew /home/dotfiles/install.sh

ENTRYPOINT [ "/entrypoint.sh" ]
