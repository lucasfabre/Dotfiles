set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'arzg/vim-colors-xcode'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'severin-lemaignan/vim-minimap'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on
filetype indent plugin on

" Show whitespaces
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list
" Tabs is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Nerdtree toggle on C-f
map <C-f> :NERDTreeToggle<Cr>

" nvim exit terminal with esc
tnoremap <Esc> <C-\><C-n>

" Sessions: do not ask to save the session
let g:session_autosave = 'no'

" Smooth scrolling
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 40.0
let g:comfortable_motion_air_drag = 4.0
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(60)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-60)<CR>
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Rainbow matching activate
let g:rainbow_active = 1

" FZF: config
nnoremap <C-p> :Files<Cr>
nnoremap <C-e> :Buffers<Cr>
" show preview
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('right'))
" Esc escape fzf
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" ALE: Code Fromating configuration
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_sign_error = '😠'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1

" Snipets
let g:UltiSnipsExpandTrigger       = "<c-l>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetDirectories  = ['~/.vim/UltiSnips', 'UltiSnips']

" Coc: configuration
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Disable Ex mode
map Q <Nop>

" Common vim parameters
let mapleader = ","
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

colorscheme xcodedark
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi CursorLineNR cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi LineNR cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
