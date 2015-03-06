# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"
HIST_STAMPS="dd.mm.yyyy"

# plugins
plugins=(git vi-mode colored-man rails bundler)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/zimt/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/.zsh_aliases
source /usr/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/Envs
export EDITOR=vim

eval $(dircolors ~/.dir_colors)

# Switch back and forth between two jobs
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Invoked whenever you change working directory
function chpwd() {
  ls
}

# Handy emacs
bindkey '^P' up-line-or-search
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^G' insert-last-word
bindkey '^O' push-line
# Recursive 'file search'
bindkey -s '^S' '**/*'
# Vi-mode steroids
bindkey -M vicmd "q" push-line

# Ruby
export PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"

# Spawn another terminal within current directory
nwZle() {
    zle push-line;
    BUFFER="setsid urxvt";
    zle accept-line;
}
zle -N nwZle
bindkey '^n' nwZle

# Disable lag when switching modes(vi)
export KEYTIMEOUT=1
