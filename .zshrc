if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/oizmerly/.oh-my-zsh
export TERM=screen-256color

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions virtualenv docker kubectl)

# hide user@host
export DEFAULT_USER=oizmerly
export EDITOR=nvim

source $ZSH/oh-my-zsh.sh

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

alias vim=nvim

# GO
# ...
