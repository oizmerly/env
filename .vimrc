" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set incsearch
set ruler
set laststatus=2
set visualbell
set t_vb=
set mouse=a
set cmdheight=1
set backspace=2

" UI theme
set number
set cursorline
if has("gui_running")
else
    set t_Co=256
endif

" tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" shared clipboard
set clipboard=unnamedplus
",unnamed,autoselect

" macvim default font
set guifont=Consolas\ NF:h15

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
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'yorokobi/vim-splunk'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
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

" lightline
set laststatus=2
let g:lightline = {
  \   'colorscheme': 'Dracula',
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

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

let g:indentLine_enabled = 1 

" node
let b:node_root='/usr/local/bin/node'    

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color theme
set background=dark
colorscheme palenight
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
let g:palenight_terminal_italics=1

" ruler
set colorcolumn=80,120
highlight ColorColumn ctermbg=236 guibg=#363636

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts
:nmap <C-e> :VimFilerBufferDir -toggle -explorer<CR>
:imap <C-w> <Esc>:w<kEnter>i  

" Disable fancy concealing of attribute quotes.
set conceallevel=0
