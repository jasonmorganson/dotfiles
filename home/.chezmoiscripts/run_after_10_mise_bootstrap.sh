#!/bin/sh
set -eu

required_version="2026.7.4"
current_version="$(mise --version | awk '{ print $1 }')"

version_ge() {
    awk -v current="$1" -v required="$2" '
        BEGIN {
            split(current, c, ".")
            split(required, r, ".")
            for (i = 1; i <= 3; i++) {
                cv = c[i] + 0
                rv = r[i] + 0
                if (cv > rv) exit 0
                if (cv < rv) exit 1
            }
            exit 0
        }
    '
}

if ! version_ge "$current_version" "$required_version"; then
    echo "mise ${required_version} or newer is required for stable bootstrap; current version is ${current_version}." >&2
    echo "Run: mise self-update ${required_version}" >&2
    exit 1
fi

mise bootstrap --yes
