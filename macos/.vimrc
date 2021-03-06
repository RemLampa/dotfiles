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
set laststatus=2

set backup
set backupcopy=yes
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
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'wincent/terminus'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-sleuth'
  Plug 'w0rp/ale'
  Plug 'kristijanhusak/vim-carbon-now-sh'
  Plug 'tpope/vim-surround'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'airblade/vim-gitgutter'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'powerline/powerline'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'valloric/youcompleteme'
  Plug 'tpope/vim-commentary'
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'jparise/vim-graphql'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'
  Plug 'janko-m/vim-test'
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

" YCM settings
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" vim-closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1

" carbon screenshot settings
vnoremap <F5> :CarbonNowSh<CR>

" lightline settings
let g:lightline = {
  \     'colorscheme': 'wombat',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch'], ['readonly', 'relativepath', 'modified']],
  \         'right': [['lineinfo'], ['fileformat', 'fileencoding']]
  \     },
  \     'inactive': {
  \         'left': [['relativepath']],
  \         'right': [['lineinfo']]
  \     },
  \     'component_function': {
  \       'gitbranch': 'fugitive#head',
  \       'relativepath': 'LightLineFilename'
  \     }
  \ }
function! LightLineFilename()
  return expand('%')
endfunction
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.tabline = {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" fzf settings
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }

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
nnoremap <c-p> :FZF<CR>
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
