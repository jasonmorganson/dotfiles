if [ -f ~/loader ]; then
  export CHERRE_LOADER="${HOME}/loader"
elif [ -f ~/cherre-lib/loader ]; then
  export CHERRE_LOADER="${HOME}/cherre-lib/loader"
elif [ -f /opt/cherre-lib/loader ]; then
  #shellcheck disable=1091
  export CHERRE_LOADER="/opt/cherre-lib/loader"
else
  echo "Couldn't load loader, file not found"
fi
#shellcheck disable=1090
. $CHERRE_LOADER