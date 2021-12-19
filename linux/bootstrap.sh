sudo apt upgrade
sudo apt update
sudo apt install -y \
	alacritty \
	zsh \
	tmux \
	neovim \
	build-essential \
	code
  mc


# zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cat > ~/.zshrc <<EOL
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

ZSH_THEME=powerlevel10k/powerlevel10k
export DEFAULT_USER=$USER

plugins=(git zsh-syntax-highlighting vi-mode zsh-history-substring-search zsh-autosuggestions virtualenv docker kubectl)

source $ZSH/oh-my-zsh.sh
EOL

# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cat > ~/.tmux.conf <<EOL
set -g default-terminal 'screen-256color'
set -ga terminal-overrides ',screen-256color:Tc'

# history
set -g history-limit 1000000

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set -g prefix C-Space
bind Space send-prefix

bind -n C-k send-keys -R \; send-keys C-l \; clear-history

bind -n S-Right next-window
bind -n S-Left previous-window

bind -n C-t new-window -c "#{pane_current_path}"
bind -n C-w kill-window

# split panes using | and -
bind c new-window -c "#{pane_current_path}"
bind \\\\ split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# home/end keys
bind -n End send-key C-e
bind -n Home send-key C-a

# swap panes
unbind \{
bind \{ swap-pane -D
unbind \}
bind \} swap-pane -U

# swap windows
unbind C-S-Left
unbind C-S-Right
bind -n C-S-Left swap-window -t -1 \; previous-window
bind -n C-S-Right swap-window -t +1 \; next-window

set -g mouse on

# clipboard
setw -g mode-keys vi
bind-key -T edit-mode-vi Up send-keys -X history-up
bind-key -T edit-mode-vi Down send-keys -X history-down
unbind-key -T copy-mode-vi Space     ;   bind-key -T copy-mode-vi v send-keys -X begin-selection
unbind-key -T copy-mode-vi Enter     ;   bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"
unbind-key -T copy-mode-vi C-v       ;   bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
unbind-key -T copy-mode-vi [         ;   bind-key -T copy-mode-vi [ send-keys -X begin-selection
unbind-key -T copy-mode-vi ]         ;   bind-key -T copy-mode-vi ] send-keys -X copy-selection

# plugins
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# theme
set -g @plugin 'dracula/tmux'
set -g @dracula-show-weather false
set -g @dracula-show-powerline true
set -g @dracula-cpu-usage true
set -g @dracula-ram-usage true
set -g @dracula-show-left-icon window
set -g @dracula-border-contrast true
set -g @dracula-left-icon-padding 1

run '~/.tmux/plugins/tpm/tpm'

set-option -g status-position bottom
set-window-option -g window-status-separator ' ' 
EOL

# alacrity
mkdir -p ~/.config/alacritty
cat > ~/.config/alacritty/alacritty.yml <<EOL
env:
  TERM: xterm-256color

window:
  padding:
    x: 5
    y: 5
  dynamic_padding: false
  decorations: none
  startup_mode: Maximized
  dynamic_title: true

# custom_cursor_colors: true
# hide_cursor_when_typing: true

mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

key_bindings:
  - { key: N, mods: Command, action: SpawnNewInstance }
  - { key: W, mods: Command, action: None             }

font:
  normal:
    family: FiraCode Nerd Font
  bold:
    family: FiraCode Nerd Font
    style: Bold
  italic:
    family: FiraCode Nerd Font
    style: Italic
  size: 12.0
  use_thin_strokes: true

colors: # dracula
  primary:
    background: '#282a36'
    foreground: '#f8f8f2'
    bright_foreground: '#ffffff'
  cursor:
    text: CellBackground
    cursor: CellForeground
  vi_mode_cursor:
    text: CellBackground
    cursor: CellForeground
  search:
    matches:
      foreground: '#44475a'
      background: '#50fa7b'
    focused_match:
      foreground: '#44475a'
      background: '#ffb86c'
    bar:
      background: '#282a36'
      foreground: '#f8f8f2'
  hints:
    start:
      foreground: '#282a36'
      background: '#f1fa8c'
    end:
      foreground: '#f1fa8c'
      background: '#282a36'
  line_indicator:
    foreground: None
    background: None
  selection:
    text: CellForeground
    background: '#44475a'
  normal:
    black: '#21222c'
    red: '#ff5555'
    green: '#50fa7b'
    yellow: '#f1fa8c'
    blue: '#bd93f9'
    magenta: '#ff79c6'
    cyan: '#8be9fd'
    white: '#f8f8f2'
  bright:
    black: '#6272a4'
    red: '#ff6e6e'
    green: '#69ff94'
    yellow: '#ffffa5'
    blue: '#d6acff'
    magenta: '#ff92df'
    cyan: '#a4ffff'
    white: '#ffffff'
EOL

# vim
git clone https://github.com/wbthomason/packer.nvim ~/.config/nvim/pack/packer/start/packer.nvim
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.lua <<EOL
vim.o.termguicolors = true
vim.o.number = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.ruler = true
vim.o.cmdheight = 1
vim.o.backspace = 2
vim.o.mouse = 'a'
vim.o.number = true
vim.o.cursorline = true
vim.o.t_Co=256

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
end)

-- theme
vim.o.background = 'dark'
vim.cmd [[colorscheme dracula]]
vim.o.colorcolumn='80,120'
EOL
