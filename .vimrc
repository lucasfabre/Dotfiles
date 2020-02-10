set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
filetype plugin indent on
filetype indent plugin on

" Show whitespaces
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list
" Tabs is 4 spaces
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" nvim exit terminal with esc
tnoremap <Esc> <C-\><C-n>

" Sessions: do not ask to save the session
let g:session_autosave = 'no'

syntax on
set hidden
set nowrap
set wildmenu
set showcmd
set hlsearch
set smartcase
set backspace=indent,eol,start
set autoindent
set ruler
set laststatus=1
set confirm
set visualbell
set t_vb=
set mouse=a
set number relativenumber
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

" Snipets
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

set background=dark
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi CursorLineNR cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi LineNR cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
