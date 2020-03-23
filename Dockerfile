FROM debian:stable

LABEL name="jasonmorganson/dotfiles"
LABEL maintainer="Jason Morganson <jmorganson@gmail.com>"

ARG USER=jason

ENV USER=$USER \
    HOME=/home/$USER \
    LANG=en_US.UTF-8

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
    # SEE: https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    # Add user account
    && useradd --create-home --home-dir $HOME $USER

USER $USER

WORKDIR $HOME

# Install linuxbrew
COPY --from=linuxbrew/debian --chown=$USER /home/linuxbrew /home/linuxbrew

# Add linuxbrew binaries to path
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

# Install brew bundles
COPY --chown=$USER Brewfile .
RUN brew update && brew bundle install

# Use linuxbrew asdf directory
ENV ASDF_DIR=/home/linuxbrew/.linuxbrew/opt/asdf
ENV ASDF_DATA_DIR=$ASDF_DIR
ENV PATH=$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH

# Ensure asdf is installed
RUN brew install asdf \
    # Add asdf plugins
    && asdf plugin add k9s \
    && asdf plugin add helm \
    && asdf plugin add shfmt \
    && asdf plugin add nodejs \
    && asdf plugin add python \
    && asdf plugin add kubectx \
    && asdf plugin add helmfile \
    && asdf plugin add postgres \
    && asdf plugin add shellcheck \
    && asdf plugin add stern https://github.com/looztra/asdf-stern \
    && asdf plugin add yq https://github.com/sudermanjr/asdf-yq.git \
    && asdf plugin add sops https://github.com/feniix/asdf-sops.git \
    && asdf plugin add kubectl https://github.com/Banno/asdf-kubectl.git \
    && asdf plugin add gcloud https://github.com/jthegedus/asdf-gcloud.git \
    && asdf plugin add skaffold https://github.com/kristoflemmens/asdf-skaffold.git

# FIXME: Installing python first as a workaround to gcloud requiring it 
# SEE: https://github.com/jthegedus/asdf-gcloud/blob/master/bin/exec-env#L6
RUN asdf install python 3.6.8

# Import the Node.js release team's OpenPGP keys to main keyring
RUN $ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring

# Install asdf packages
COPY --chown=$USER .tool-versions .
RUN asdf install

# Install helm plugins
RUN helm plugin install https://github.com/nouney/helm-gcs \
    && helm plugin install https://github.com/aslafy-z/helm-git \
    && helm plugin install https://github.com/databus23/helm-diff \
    && helm plugin install https://github.com/futuresimple/helm-secrets \
    && helm repo add stable https://kubernetes-charts.storage.googleapis.com

COPY --chown=$USER . .

CMD ["zsh"]
