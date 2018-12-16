export ZSH="/home/al/.oh-my-zsh"
export TERM=screen-256color

# theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME="dark"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions virtualenv docker kubectl)

# hide user@host
export DEFAULT_USER=al

source $ZSH/oh-my-zsh.sh

alias mc='mc -x'
# keybindings
bindkey "^R" history-incremental-search-backward
