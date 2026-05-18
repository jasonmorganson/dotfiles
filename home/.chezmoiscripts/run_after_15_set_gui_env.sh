#!/bin/sh
set -eu

[ "$(uname -s)" = "Darwin" ] || exit 0

MISE="${HOME}/.local/bin/mise"
[ -x "$MISE" ] || exit 0

eval "$("$MISE" env --shell bash)"

[ -n "${CLAUDE_CONFIG_DIR:-}" ] || exit 0

launchctl setenv CLAUDE_CONFIG_DIR "$CLAUDE_CONFIG_DIR"
