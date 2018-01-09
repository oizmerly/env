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
set clipboard=unnamedplus,unnamed,autoselect

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
Plugin 'vim-airline/vim-airline-themes'
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
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_highlight_lines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'  " close to gruvbox
let g:airline#extensions#tabline#enabled = 1  " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'  " show just the filename

" Plugins

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
colorscheme gruvbox

" set background=light
" colorscheme solarized

highlight LineNr ctermfg=240 ctermbg=236 guifg=#505050 guibg=#303030
" ruler
set colorcolumn=120
highlight ColorColumn ctermbg=236 guibg=#303030

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts
:nmap <C-e> :VimFilerBufferDir -toggle -explorer<CR>
:imap <C-w> <Esc>:w<kEnter>i  

" Disable fancy concealing of attribute quotes.
set conceallevel=0
