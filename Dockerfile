FROM debian:stable

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    ENV=$HOME/.profile \
    BASH_ENV=$ENV \
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew \
    ASDF_DIR=$HOMEBREW_PREFIX/opt/asdf \
    PATH=$ASDF_DIR/bin:$ASDF_DIR/shims:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH

RUN apt-get update \
    && apt-get install --yes \
    # Install sudo
    sudo \
    # Install all locales
    locales locales-all \
    # Install chezmoi requirements
    curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Add user account
    && useradd --shell /bin/bash --groups sudo --create-home --home-dir $HOME $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

WORKDIR $HOME

SHELL ["/bin/bash", "-o", "pipefail", "-c"]


COPY . .

RUN ./install.sh

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
