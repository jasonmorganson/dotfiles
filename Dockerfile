FROM debian:stable

ARG USER=jasonmorganson
ARG NAME="Jason Morganson"
ARG EMAIL=jason@cherre.com

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8

RUN apt-get update \
    && apt-get install --yes \
    # Install sudo
    sudo \
    # Install chezmoi requirements
    curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Add user account
    && useradd --groups sudo --create-home --home-dir $HOME $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

WORKDIR $HOME

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV PATH=./bin:$PATH

RUN curl -sfL https://git.io/chezmoi | sh
RUN chezmoi init --apply --verbose https://github.com/jasonmorganson/dotfiles.git

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
