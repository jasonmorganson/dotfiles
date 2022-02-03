FROM jasonmorganson/dotfiles

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    SHELL=/home/linuxbrew/.linuxbrew/bin/zsh \
    HEADLESS=true

USER $USER

WORKDIR $HOME

COPY . .

RUN ./install.sh

ENTRYPOINT [ "/home/linuxbrew/.linuxbrew/bin/zsh", "--login" ]
