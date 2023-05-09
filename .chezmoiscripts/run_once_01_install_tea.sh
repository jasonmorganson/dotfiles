#!/bin/sh
. ./.profile
set -eu

# Install tea
curl tea.xyz | SHELL=no sh -s -- --yes
