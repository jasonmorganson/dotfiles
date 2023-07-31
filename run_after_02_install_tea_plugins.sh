#!/bin/sh
. ./.profile
set -eu

# Install tea plugins
tea --sync --silent
