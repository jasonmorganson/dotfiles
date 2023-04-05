#!/bin/sh
. ./.profile
set -eu

# Install tea
curl -Lo "${LOCAL_BIN_PATH}/tea" "https://tea.xyz/$(uname)/$(uname -m)" && chmod u+x "${LOCAL_BIN_PATH}/tea"
