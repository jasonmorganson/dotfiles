#!/bin/sh

uid="${USER_UID:-1000}"
gid="${USER_GID:-1000}"
base_user="$(id --user --name "$uid")"
base_group="$(id --group --name "$uid")"
base_home="$(eval echo "~$base_user")"
user="${USER:-$base_user}"
group="$user"
home="/home/$user"
shell="${SHELL:-/bin/sh}"

sudo groupmod --gid "$gid" --new-name "$group" "$base_group"
sudo usermod --non-unique --gid "$gid" --uid "$uid" --home "$home" --shell "$shell" --login "$user" "$base_user"
sudo ln --symbolic --no-dereference "$base_home" "$home"
sudo chown --no-dereference "$user" "$home"
sudo su --login --shell "$shell" "$user"
