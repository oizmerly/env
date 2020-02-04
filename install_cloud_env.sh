echo TMUX

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat > ~/.tmux.conf <<EOL
set -g default-terminal 'screen-256color'
set -ga terminal-overrides ',screen-256color:Tc'

# history
set -g history-limit 100000

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

bind -n C-k send-keys -R \; send-keys C-l \; clear-history

bind -n S-Right next-window
bind -n S-Left previous-window

# split panes using | and -
bind c new-window -c "#{pane_current_path}"
bind \\ split-window -h -c "#{pane_current_path}"
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
unbind '{'
bind '{' swap-pane -D
unbind '}'
bind '}' swap-pane -U

# swap windows
unbind C-S-Left
unbind C-S-Right
bind-key -n C-S-Left swap-window -t -1
bind-key -n C-S-Right swap-window -t +1

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
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/block/cyan'
set -g @plugin 'tmux-plugins/tmux-cpu'
run '~/.tmux/plugins/tpm/tpm'

set-option -g status-position top
EOL

echo VIM

mkdir -p ~/.vim
mkdir -p ~/.config/nvim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cat > ~/.config/nvim/init.vim <<EOL
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set incsearch
set ruler
set visualbell
set t_vb=
set mouse=a
set cmdheight=1
set backspace=2

let g:enable_bold_font=1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1

" UI theme
set number
set cursorline
if has("gui_running")
else
"    set t_Co=256
endif

" tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

" shared clipboard
set clipboard+=unnamedplus,unnamed

" macvim default font
set guifont=powerline\ consolas:h15

" tabbed interface
set showtabline=1
set guioptions-=e " use 'text' tabs

" remove character from splitbar
set fillchars+=vert:\ 

" file types
au BufNewFile,BufRead *.handlebars set filetype=html

setlocal spell spelllang=en_us
set spell

" Plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'yorokobi/vim-splunk'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/indentLine'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ternjs/tern_for_vim'
Plugin 'itchyny/lightline.vim'
Plugin 'drewtempelmeyer/palenight.vim'
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" node
let b:node_root='/usr/local/bin/node'    

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

let g:indentLine_enabled = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color theme

set background=dark
colorscheme palenight
if (has("nvim"))
    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	set termguicolors
endif
if (has("termguicolors"))
    set termguicolors
endif
let g:palenight_terminal_italics=1

" ruler
set colorcolumn=80,120
highlight ColorColumn ctermbg=236 guibg=#363636

" lightline
let g:lightline = {
  \   'colorscheme': 'seoul256',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \   'left': '', 'right': '' 
  \}

set laststatus=2
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts
:nmap <C-e> :VimFilerBufferDir -toggle -explorer<CR>
:imap <C-w> <Esc>:w<kEnter>i  

" Disable fancy concealing of attribute quotes.
set conceallevel=0
EOL

echo FISH SHELL

chsh -s /usr/bin/fish
curl -L https://get.oh-my.fish | fish
omf install agnoster

cat > ~/.config/fish/config.fish <<EOL
export BUILD_HOME=~/s/nanolabs-io/build/docker

export DEFAULT_USER=oleg
alias vim=nvim
EOL

mkdir -p ~/.config/alacritty
cat > ~/.tmux.conf <<EOL
colors:
  # Default colors
  primary:
    background: '0x1e282d'
    foreground: '0xc4c7d1'

  # Normal colors
  normal:
    black:   '0x666666'
    red:     '0xeb606b'
    green:   '0xc3e88d'
    yellow:  '0xf7eb95'
    blue:    '0x80cbc4'
    magenta: '0xff2f90'
    cyan:    '0xaeddff'
    white:   '0xffffff'

  # Bright colors
  bright:
    black:   '0xff262b'
    red:     '0xeb606b'
    green:   '0xc3e88d'
    yellow:  '0xf7eb95'
    blue:    '0x7dc6bf'
    magenta: '0x6c71c4'
    cyan:    '0x35434d'
    white:   '0xffffff'

font:
  size: 15

  normal:
    family: Consolas NF
    style: Bold
  
  bold:
    family: Consolas NF
    style: Bold

  italic:
    family: Consolas NF
    style: Italic

  bold_italic:
    family: Consolas NF
EOL
