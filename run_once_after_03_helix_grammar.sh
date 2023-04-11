#!/bin/sh
. ./.profile
set -eu

tea hx --grammar fetch
tea hx --grammar build
