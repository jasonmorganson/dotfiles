FROM debian:stable

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8

RUN apt-get update \
    && apt-get install --yes \
    # Install sudo
    sudo \
    # Install all locales
    locales \
    # Install chezmoi requirements
    curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Make the "en_US.UTF-8" locale
    # SEE: https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
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
ENV PATH=./bin:$PATH

COPY . .

RUN ./install.sh

CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
