FROM debian:stable

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    SHELL=/home/linuxbrew/.linuxbrew/bin/zsh \
    HEADLESS=true

RUN apt-get update \
    && apt-get install --yes sudo curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --shell $SHELL --groups sudo --create-home --home-dir $HOME $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER

WORKDIR $HOME

COPY . .

RUN ./install.sh

COPY install.sh personalize
COPY install.sh /coder/configure

ENTRYPOINT [ "/home/linuxbrew/.linuxbrew/bin/zsh", "--login" ]
