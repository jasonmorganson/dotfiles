setopt clobber

#
# Paths
#

# Set the list of directories that Zsh searches for programs.
path=(
  ./bin
  ./.bin
  ~/bin
  ~/.bin
  ~/.local/bin
  ~/.nvm/current/bin
  ~/.gem/ruby/current/bin
  ~/.linuxbrew/bin
  /usr/local/bin
  /usr/local/sbin
  /opt/bin
  /usr/bin
  /sbin
  /bin
  $path
)

