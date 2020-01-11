FROM debian:stable

LABEL name="jasonmorganson/dotfiles"
LABEL maintainer="Jason Morganson <jmorganson@gmail.com>"

ARG USER=jason

ENV LANG=en_US.UTF-8 \
    PATH=/home/$USER/.linuxbrew/bin:/home/$USER/.linuxbrew/sbin:$PATH \
    SHELL=/home/$USER/.linuxbrew/bin/zsh

RUN apt-get update \
    && apt-get install -y \
    # Install all locales
    locales \
    # Install linuxbrew requirements
    # SEE: https://docs.brew.sh/Homebrew-on-Linux#debian-or-ubuntu
    build-essential curl file git \
    # Install python requirements
    # SEE: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev \
    # Install asdf NodeJS requirements
    # FIXME: This is a workaround for gpg not installing with brew
    # SEE: https://github.com/Homebrew/linuxbrew-core/issues/18359
    gpg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Update locale to en_US.UTF-8
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8 \
    # Add user account
    && useradd --create-home --shell $SHELL $USER

USER $USER

WORKDIR /home/$USER

# Install linuxbrew
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# Install brew packages
COPY --chown=$USER Brewfile .
RUN brew bundle install

# Pre-compile ZSH plugins
COPY --chown=$USER .zsh-plugins .
RUN antibody bundle < ~/.zsh-plugins > ~/.zsh-plugins.sh

COPY --chown=$USER . .

CMD ["zsh"]
