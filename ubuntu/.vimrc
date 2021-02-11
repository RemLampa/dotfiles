syntax on
set syn=auto
set nocompatible
set background=dark
" colorscheme darcula
colorscheme gruvbox
" colorscheme default
set title
set showcmd
set cursorline
set lazyredraw
set wildmenu
set showmatch
set incsearch
set hlsearch
set clipboard=unnamedplus
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
hi Normal guibg=NONE ctermbg=NONE

set backup
set backupcopy=yes
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

filetype plugin indent on

" cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" relative/absolute line number toggling
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" remove line numbers on inactive windows
" augroup BgHighlight
"   autocmd!
"   autocmd WinEnter * set number
"   autocmd WinLeave * set nonumber
" augroup END

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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-sleuth'
  Plug 'ap/vim-css-color'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'dense-analysis/ale'
  Plug 'kristijanhusak/vim-carbon-now-sh'
  Plug 'tpope/vim-surround'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'airblade/vim-gitgutter'
  Plug 'quramy/tsuquyomi'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-repeat'
  Plug 'sheerun/vim-polyglot'
  " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'ervandew/supertab'
  Plug 'valloric/youcompleteme'
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-unimpaired'
  " Tabular before vim-markdown
  Plug 'godlygeek/tabular'
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

" nerdtree settings
let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" lightline settings
let g:lightline = {
  \     'colorscheme': 'wombat',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'relativepath', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
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
  \   'left': [ ['gitbranch'], ['buffers'] ],
  \   'right': [ ['close'] ]
  \ }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" vim-closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.ts,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,ts,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,ts,tsx'
let g:closetag_emptyTags_caseSensitive = 1

" carbon screenshot settings
vnoremap <F5> :CarbonNowSh<CR>

" YCM settings
" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

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
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_preview_window = 'right:60%'

" linting
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}

let g:ale_python_pylint_options = '--load-plugins pylint_django'

" lint fixing
let g:ale_fixers = {
\   "javascript": ["eslint"],
\   "json": ["eslint", "prettier"],
\   "graphql": ["eslint", "prettier"],
\   "typescript": ["eslint", "prettier"],
\   "typescriptreact": ["eslint", "prettier"],
\   "go": ["gofmt"],
\   "python": ["remove_trailing_lines", "isort", "ale#fixers#generic_python#BreakUpLongLines", "yapf"],
\   "java": ["google_java_format"],
\   "css": ["prettier"],
\   "markdown": ["prettier"],
\   "yaml": ["prettier"],
\   "*": ["remove_trailing_lines", "trim_whitespace"]
\}

let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" disable polyglot on typescript temporarily
" let g:polyglot_disabled = ["typescript", "typescriptreact"]

" Svelte settings
let g:svelte_preprocessors = ['typescript', 'scss']

" Untisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" vim jsx pretty
let g:vim_jsx_pretty_colorful_config = 1

" vim test strategy
let test#strategy = "dispatch"

" enable indentguides
let g:indent_guides_enable_on_vim_startup = 1

" vim-go settings
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

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1

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
nnoremap <c-p> :Files<CR>
nnoremap gf :GFiles<CR>
nnoremap gs :GFiles?<CR>
nnoremap gb :Buffers<CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gl :YcmCompleter GoToDeclaration<CR>

" find and replace
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" keybindings for running tests
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" resync syntax higlighting
nnoremap <F12> <Esc>:syntax sync fromstart<CR>

" Troubleshoot DevIcons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
