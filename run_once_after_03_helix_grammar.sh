#!/bin/sh
. ./.profile
set -eu

hx --grammar fetch
hx --grammar build
