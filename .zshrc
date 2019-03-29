export ZSH=/Users/oizmerly/.oh-my-zsh
export TERM=screen-256color

# theme
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true

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

# function git_prompt_info() {
#   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#     echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
# }

# # multiline prompt
# prompt_newline() {
#   if [[ -n $CURRENT_BG ]]; then
#     echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%k%F{blue}%}$SEGMENT_SEPARATOR"
#   else
#     echo -n "%{%k%}"
#   fi

#   echo -n "%{%f%}"
#   CURRENT_BG=''
# }

# build_prompt() {
#     RETVAL=$?
#     prompt_status
#     prompt_virtualenv
#     prompt_context
#     prompt_dir
#     prompt_git
#     prompt_hg
#     #prompt_newline
#     prompt_end
# }

# keybindings
bindkey "^R" history-incremental-search-backward
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/oizmerly/dev/playground/dos-navigator-3/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/oizmerly/dev/playground/dos-navigator-3/node_modules/tabtab/.completions/electron-forge.zsh
