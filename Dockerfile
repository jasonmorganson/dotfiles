FROM buildpack-deps:scm AS base

ARG USER=user
ARG NAME="Name"
ARG EMAIL=user@co.co

ENV USER=$USER \
    HOME=/home/$USER \
    HEADLESS=true

RUN apt-get update && apt-get install sudo
RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --non-unique --uid 1000 --user-group --create-home --home-dir $HOME $USER

FROM base

USER $USER

WORKDIR $HOME

COPY --chown=$USER . .

RUN ./install.sh

ENTRYPOINT [ "./entrypoint.sh" ]
