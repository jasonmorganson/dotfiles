#zmodload zsh/zprof

export NVM_LAZY_LOAD=true

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

# Have zplug manage itself like other plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins:

zplug "chrissicool/zsh-256color"
zplug "willghatch/zsh-saneopt"
zplug "mafredri/zsh-async"
zplug "djui/alias-tips"
zplug "rimraf/k"
zplug "Tarrasch/zsh-bd"
zplug "johnhamelink/env-zsh"
zplug "joshuarubin/zsh-fzf"
zplug "uvaes/fzf-marks"
zplug "atweiden/fzf-extras"
zplug "srijanshetty/zsh-suffix-alias"
zplug "ascii-soup/zsh-url-highlighter"
zplug "TBSliver/zsh-plugin-tmux-simple"
zplug "wbinglee/zsh-wakatime"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "felixr/docker-zsh-completion"
zplug "srijanshetty/zsh-pip-completion"
zplug "edouard-lopez/yeoman-zsh-plugin"
zplug "vasyharan/zsh-brew-services"
zplug "lukechilds/zsh-better-npm-completion"
zplug "lukechilds/zsh-nvm"
zplug "sindresorhus/pure"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

#zprof
