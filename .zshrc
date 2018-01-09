export ZSH=/Users/oizmerly/.oh-my-zsh

ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/MyApps/Dev:/Users/oizmerly/local/bin"

# hide user@host
export DEFAULT_USER=oizmerly

source $ZSH/oh-my-zsh.sh

alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
alias json='python -m json.tool'
alias clion='/Applications/MyApps/Dev/CLion.app/Contents/MacOS/clion'

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# multiline prompt
prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%k%F{blue}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}

build_prompt() {
    RETVAL=$?
    prompt_status
    prompt_virtualenv
    prompt_context
    prompt_dir
    prompt_git
    prompt_hg
    #prompt_newline
    prompt_end
}

# keybindings
bindkey "^R" history-incremental-search-backward
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

export TERM=screen-256color

################################################################################
# fix terminal colors
if [ "${TERM%%-*}" = "screen" ]; then
  if [ -n "$TMUX" ]; then
    printf "\033Ptmux;\033\033]4;236;rgb:26/24/23\007\033\\"
    printf "\033Ptmux;\033\033]4;234;rgb:16/18/19\007\033\\"

    printf "\033Ptmux;\033\033]4;235;rgb:1e/1e/1e\007\033\\"
    printf "\033Ptmux;\033\033]4;237;rgb:2e/2a/29\007\033\\"
    printf "\033Ptmux;\033\033]4;239;rgb:3f/39/35\007\033\\"
    printf "\033Ptmux;\033\033]4;241;rgb:53/4a/42\007\033\\"
    printf "\033Ptmux;\033\033]4;243;rgb:68/5c/51\007\033\\"

    printf "\033Ptmux;\033\033]4;244;rgb:7f/70/61\007\033\\"
    printf "\033Ptmux;\033\033]4;245;rgb:7f/70/61\007\033\\"

    printf "\033Ptmux;\033\033]4;228;rgb:ef/df/ae\007\033\\"
    printf "\033Ptmux;\033\033]4;230;rgb:f8/f4/cd\007\033\\"

    printf "\033Ptmux;\033\033]4;229;rgb:fa/ee/bb\007\033\\"
    printf "\033Ptmux;\033\033]4;223;rgb:e6/d4/a3\007\033\\"
    printf "\033Ptmux;\033\033]4;250;rgb:cb/b8/90\007\033\\"
    printf "\033Ptmux;\033\033]4;248;rgb:af/9f/81\007\033\\"
    printf "\033Ptmux;\033\033]4;246;rgb:97/87/71\007\033\\"

    printf "\033Ptmux;\033\033]4;167;rgb:f7/30/28\007\033\\"
    printf "\033Ptmux;\033\033]4;142;rgb:aa/b0/1e\007\033\\"
    printf "\033Ptmux;\033\033]4;214;rgb:f7/b1/25\007\033\\"
    printf "\033Ptmux;\033\033]4;109;rgb:71/95/86\007\033\\"
    printf "\033Ptmux;\033\033]4;175;rgb:c7/70/89\007\033\\"
    printf "\033Ptmux;\033\033]4;108;rgb:7d/b6/69\007\033\\"
    printf "\033Ptmux;\033\033]4;208;rgb:fb/6a/16\007\033\\"

    printf "\033Ptmux;\033\033]4;88;rgb:89/00/09\007\033\\"
    printf "\033Ptmux;\033\033]4;100;rgb:66/62/0d\007\033\\"
    printf "\033Ptmux;\033\033]4;136;rgb:a5/63/11\007\033\\"
    printf "\033Ptmux;\033\033]4;24;rgb:0e/53/65\007\033\\"
    printf "\033Ptmux;\033\033]4;96;rgb:7b/2b/5e\007\033\\"
    printf "\033Ptmux;\033\033]4;66;rgb:35/6a/46\007\033\\"
    printf "\033Ptmux;\033\033]4;130;rgb:9d/28/07\007\033\\"
  else
    printf "\033P\033]4;236;rgb:26/24/23\007\033\\"
    printf "\033P\033]4;234;rgb:16/18/19\007\033\\"

    printf "\033P\033]4;235;rgb:1e/1e/1e\007\033\\"
    printf "\033P\033]4;237;rgb:2e/2a/29\007\033\\"
    printf "\033P\033]4;239;rgb:3f/39/35\007\033\\"
    printf "\033P\033]4;241;rgb:53/4a/42\007\033\\"
    printf "\033P\033]4;243;rgb:68/5c/51\007\033\\"

    printf "\033P\033]4;244;rgb:7f/70/61\007\033\\"
    printf "\033P\033]4;245;rgb:7f/70/61\007\033\\"

    printf "\033P\033]4;228;rgb:ef/df/ae\007\033\\"
    printf "\033P\033]4;230;rgb:f8/f4/cd\007\033\\"

    printf "\033P\033]4;229;rgb:fa/ee/bb\007\033\\"
    printf "\033P\033]4;223;rgb:e6/d4/a3\007\033\\"
    printf "\033P\033]4;250;rgb:cb/b8/90\007\033\\"
    printf "\033P\033]4;248;rgb:af/9f/81\007\033\\"
    printf "\033P\033]4;246;rgb:97/87/71\007\033\\"

    printf "\033P\033]4;167;rgb:f7/30/28\007\033\\"
    printf "\033P\033]4;142;rgb:aa/b0/1e\007\033\\"
    printf "\033P\033]4;214;rgb:f7/b1/25\007\033\\"
    printf "\033P\033]4;109;rgb:71/95/86\007\033\\"
    printf "\033P\033]4;175;rgb:c7/70/89\007\033\\"
    printf "\033P\033]4;108;rgb:7d/b6/69\007\033\\"
    printf "\033P\033]4;208;rgb:fb/6a/16\007\033\\"

    printf "\033P\033]4;88;rgb:89/00/09\007\033\\"
    printf "\033P\033]4;100;rgb:66/62/0d\007\033\\"
    printf "\033P\033]4;136;rgb:a5/63/11\007\033\\"
    printf "\033P\033]4;24;rgb:0e/53/65\007\033\\"
    printf "\033P\033]4;96;rgb:7b/2b/5e\007\033\\"
    printf "\033P\033]4;66;rgb:35/6a/46\007\033\\"
    printf "\033P\033]4;130;rgb:9d/28/07\007\033\\"
  fi
else
  printf "\033]4;236;rgb:26/24/23\033\\"
  printf "\033]4;234;rgb:16/18/19\033\\"

  printf "\033]4;235;rgb:1e/1e/1e\033\\"
  printf "\033]4;237;rgb:2e/2a/29\033\\"
  printf "\033]4;239;rgb:3f/39/35\033\\"
  printf "\033]4;241;rgb:53/4a/42\033\\"
  printf "\033]4;243;rgb:68/5c/51\033\\"

  printf "\033]4;244;rgb:7f/70/61\033\\"
  printf "\033]4;245;rgb:7f/70/61\033\\"

  printf "\033]4;228;rgb:ef/df/ae\033\\"
  printf "\033]4;230;rgb:f8/f4/cd\033\\"

  printf "\033]4;229;rgb:fa/ee/bb\033\\"
  printf "\033]4;223;rgb:e6/d4/a3\033\\"
  printf "\033]4;250;rgb:cb/b8/90\033\\"
  printf "\033]4;248;rgb:af/9f/81\033\\"
  printf "\033]4;246;rgb:97/87/71\033\\"

  printf "\033]4;167;rgb:f7/30/28\033\\"
  printf "\033]4;142;rgb:aa/b0/1e\033\\"
  printf "\033]4;214;rgb:f7/b1/25\033\\"
  printf "\033]4;109;rgb:71/95/86\033\\"
  printf "\033]4;175;rgb:c7/70/89\033\\"
  printf "\033]4;108;rgb:7d/b6/69\033\\"
  printf "\033]4;208;rgb:fb/6a/16\033\\"

  printf "\033]4;88;rgb:89/00/09\033\\"
  printf "\033]4;100;rgb:66/62/0d\033\\"
  printf "\033]4;136;rgb:a5/63/11\033\\"
  printf "\033]4;24;rgb:0e/53/65\033\\"
  printf "\033]4;96;rgb:7b/2b/5e\033\\"
  printf "\033]4;66;rgb:35/6a/46\033\\"
  printf "\033]4;130;rgb:9d/28/07\033\\"
fi

