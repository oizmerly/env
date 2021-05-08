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
set visualbell
set t_vb=
set mouse=a
set cmdheight=1
set backspace=2

let g:enable_bold_font=1
let g:enable_italic_font=1
let g:hybrid_transparent_background=1

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
" Plugin 'Shougo/vimfiler.vim'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/indentLine'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'google/vim-jsonnet'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'machakann/vim-sandwich'
Plugin 'itchyny/lightline.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" node
let b:node_root='/usr/local/bin/node'    

let g:indentLine_enabled = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color theme

set background=dark
colorscheme dracula
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
   set termguicolors
endif

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
:nmap <C-e> :NERDTreeToggleVCS<CR>
:imap <C-w> <Esc>:w<kEnter>i  

" Disable fancy concealing of attribute quotes.
set conceallevel=0
