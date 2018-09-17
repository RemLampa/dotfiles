syntax enable
set nocompatible
set background=dark
" colorscheme darcula
colorscheme gruvbox
" colorscheme default
set showcmd
set cursorline
set lazyredraw
set wildmenu
set showmatch
set incsearch
set hlsearch
set clipboard=unnamed
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set ruler
set backspace=indent,eol,start
set termguicolors
set encoding=UTF-8
set splitbelow
set splitright

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

filetype plugin on
filetype plugin indent on

" relative/absolute line number toggling
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins
call plug#begin ('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'wincent/terminus'
  Plug 'christoomey/vim-tmux-navigator'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-sleuth'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'w0rp/ale'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-surround'
  Plug 'altercation/vim-colors-solarized'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'powerline/powerline'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-repeat'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-dispatch'
  Plug 'janko-m/vim-test'
  Plug 'leafgarland/typescript-vim'
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'quramy/tsuquyomi'
  " Tabular before vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'tpope/vim-obsession'
  " vim-devicons always at end of plugins
  Plug 'ryanoasis/vim-devicons'
call plug#end()

if &diff
  colorscheme gruvbox 
  " colorscheme darcula
endif

" close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "default"
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg="dark"
let g:airline_theme="base16_grayscale"

" fzf settings
set rtp+=/usr/local/opt/fzf

" lint fixing
let g:ale_fixers = {
\   "javascript": ["eslint"],
\   "go": ["gofmt"],
\   "typescript": ["eslint"],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" vim test strategy
let test#strategy = "dispatch"

" enable indentguides
let g:indent_guides_enable_on_vim_startup = 1

" synctactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" vim-go
" let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ["vet", "golint", "errcheck"]
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ["vet", "golint"]
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" CUSTOM KEY MAPPINGS

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" copy and paste from desktop clipboard
set clipboard=unnamedplus

let mapleader=" "
nnoremap <Leader>E :NERDTreeToggle<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap to  :tabnew<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap <c-p> :GFiles<Space>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" keybindings for running tests
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" Troubleshoot DevIcons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
