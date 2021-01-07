#!/bin/sh

. ./.profile

KREW_ROOT=~/.config/krew

# Install krew plugins
kubectl krew install ns
kubectl krew install ctx
kubectl krew install get-all
