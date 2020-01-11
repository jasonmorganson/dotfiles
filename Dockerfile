FROM debian:stable

LABEL name="jasonmorganson/dotfiles"
LABEL maintainer="Jason Morganson <jmorganson@gmail.com>"

ARG USER=jason

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8 \
    SHELL=$HOME/.linuxbrew/bin/zsh

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
    && useradd --create-home --home-dir $HOME --shell $SHELL $USER

USER $USER

WORKDIR $HOME

# Install linuxbrew
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# Add linuxbrew bin path to path
ENV PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH

SHELL [$SHELL, "-c"]

# Install brew bundles
COPY --chown=$USER Brewfile .
RUN brew bundle install

# Make sure brew bundles used below are installed
RUN brew install \
    # Ensure asdf is installed
    asdf
    # Also ensure unzip is installed for Terraform asdf install
    unzip

# Use linuxbrew asdf directory
ENV ASDF_DIR=$HOME/.linuxbrew/opt/asdf

# Add asdf plugins
RUN asdf plugin add helm \
    && asdf plugin add helmfile \
    && asdf plugin add k9s \
    && asdf plugin add nodejs \
    && asdf plugin add python \
    && asdf plugin add shellcheck \
    && asdf plugin add shfmt \
    && asdf plugin add stern https://github.com/looztra/asdf-stern \
    && asdf plugin add terraform

# Import the Node.js release team's OpenPGP keys to main keyring
RUN .asdf/plugins/nodejs/bin/import-release-team-keyring

COPY --chown=$USER .tool-versions .

# Install asdf packages
RUN asdf install



#####################
# CUSTOM USER STUFF #
#####################

# TODO: Move up
# Install zsh
RUN brew install zsh getantibody/tap/antibody

# Pre-compile ZSH plugins
COPY --chown=$USER .zsh-plugins .
RUN antibody bundle < ~/.zsh-plugins > ~/.zsh-plugins.sh

# TODO: Move up
# Install tmux
RUN brew install tmux

# Install tmux plugins
RUN git clone https://github.com/tmux-plugins/tpm /home/$USER/.tmux/plugins/tpm \
    && TMUX_PLUGIN_MANAGER_PATH=/home/$USER/.tmux/plugins/ /home/$USER/.tmux/plugins/tpm/bin/install_plugins

# TODO: Move up
# Install vim/neovim
RUN brew install vim neovim

# # Install vim plugins
COPY --chown=$USER .vimrc .vim-plugins .
RUN vim +'PlugInstall --sync' +qa

# Install chezmoi
RUN brew install twpayne/taps/chezmoi

COPY --chown=$USER . .

CMD [$SHELL]
