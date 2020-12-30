#!/bin/sh

# FIXME: Installing python first as a workaround to gcloud requiring it
# SEE: https://github.com/jthegedus/asdf-gcloud/blob/master/bin/exec-env#L6
asdf plugin add python
asdf install python 3.6.8
