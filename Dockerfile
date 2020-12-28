FROM debian:stable

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

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

ENV ENV=$HOME/.profile
ENV BASH_ENV=$ENV
ENV HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
ENV ASDF_DIR=$HOMEBREW_PREFIX/opt/asdf
ENV PATH=$ASDF_DIR/bin:$ASDF_DIR/shims:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH

COPY . .

RUN ./install.sh

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
