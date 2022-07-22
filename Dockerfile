FROM buildpack-deps:scm

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    SHELL=/home/linuxbrew/.linuxbrew/bin/zsh \
    HEADLESS=true

RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --non-unique --uid 1000 --user-group --shell $SHELL --create-home --home-dir $HOME $USER

USER $USER

WORKDIR $HOME

COPY --from=jasonmorganson/dotfiles /home /home

COPY . .

RUN ./install.sh

ENTRYPOINT [ "/home/linuxbrew/.linuxbrew/bin/zsh", "--login" ]
