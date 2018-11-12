export ZSH=/Users/oizmerly/.oh-my-zsh
export TERM=screen-256color

# theme
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME="dark"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions virtualenv docker kubectl)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/MyApps/Dev:/Users/oizmerly/local/bin"

# hide user@host
export DEFAULT_USER=oizmerly

source $ZSH/oh-my-zsh.sh

alias mc='mc -x'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
alias json='python -m json.tool'
alias clion='/Applications/MyApps/Dev/CLion.app/Contents/MacOS/clion'
alias vs='/Applications/MyApps/Dev/Visual\ Studio\ Code.app/Contents/MacOS/Electron' 
alias cat=bat
alias vim=nvim
alias e=micro
# keybindings
bindkey "^R" history-incremental-search-backward
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word
