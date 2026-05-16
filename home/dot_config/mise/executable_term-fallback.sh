terminfo_home="${TERMINFO:-${XDG_DATA_HOME:-$HOME/.local/share}/terminfo}"
terminfo_dirs="${TERMINFO_DIRS:-${terminfo_home}:/usr/share/terminfo}"

if [ -n "${TERM:-}" ] && [ "${TERM:-}" != "dumb" ] && command -v infocmp >/dev/null 2>&1 && ! TERMINFO="$terminfo_home" TERMINFO_DIRS="$terminfo_dirs" infocmp "$TERM" >/dev/null 2>&1; then
  for fallback_term in xterm-256color xterm vt100; do
    if TERMINFO="$terminfo_home" TERMINFO_DIRS="$terminfo_dirs" infocmp "$fallback_term" >/dev/null 2>&1; then
      export TERM="$fallback_term"
      break
    fi
  done
fi
