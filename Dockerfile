FROM debian:stable

ARG USER=user

ENV USER=$USER \
    HOME=/home/$USER

RUN apt-get update \
    && apt-get install --yes \
    # Install sudo
    sudo \
    # Install chezmoi requirements
    curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Add user account
    && useradd --shell /bin/bash --groups sudo --create-home --home-dir $HOME $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

WORKDIR $HOME

COPY . .

RUN ./install.sh

SHELL ["/home/linuxbrew/.linuxbrew/bin/zsh"]

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
