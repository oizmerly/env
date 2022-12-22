# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/oizmerly/.oh-my-zsh
export TERM=screen-256color

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions virtualenv docker kubectl)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/MyApps/Dev:/Users/oizmerly/local/bin"
source ~/.cargo/env

# hide user@host
export DEFAULT_USER=oizmerly
export EDITOR=nvim

source $ZSH/oh-my-zsh.sh

alias mc='mc -x'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
alias clion='/Applications/MyApps/Dev/CLion.app/Contents/MacOS/clion'
alias vs='/Applications/MyApps/Dev/Visual\ Studio\ Code.app/Contents/MacOS/Electron' 
alias cat=bat
alias vim=nvim
alias fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' 
alias vimdiff='nvim -d'

# keybindings
bindkey "^R" history-incremental-search-backward
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fix slowness of copy-paste
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

export PATH="/usr/local/opt/go@1.18/bin:$PATH"
export GOBIN=$HOME/dev/splunk/avanti/bin
export GOPATH=$HOME/dev/splunk/avanti
export PATH=$PATH:$GOBIN
