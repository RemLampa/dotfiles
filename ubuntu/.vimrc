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
set colorcolumn=80

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Built-in autocompletion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType sass set omnifunc=csscomplete#CompleteCSS

" Use new regular expression engine
" set re=0

" -- TABS ---
filetype plugin indent on
au BufNewFile, BufRead *.ts, *.tsx, *.js, *.jsx, *.json, *.md, *.html, *.css, *.graphql, *.gql
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" -- BACKUPS --
" Disable backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

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

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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
  Plug 'kristijanhusak/vim-carbon-now-sh'
  Plug 'tpope/vim-surround'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'fatih/vim-go'
  Plug 'Konfekt/FastFold'
  " DEV STATS
  Plug 'wakatime/vim-wakatime'
  " START JS/TS
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'jparise/vim-graphql'
  " END JS/TS
  " START PYTHON
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'tmhedberg/SimpylFold'
  Plug 'petobens/poet-v'
  " Plug 'jmcantrell/vim-virtualenv'
  " END PYTHON
  " START ELIXIR
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  " END ELIXIR
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-repeat'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
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
let g:NERDTreeWinSize=60

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

" COC settings
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_global_extensions = [
      \'coc-css',
      \'coc-cssmodules',
      \'coc-elixir',
      \'coc-eslint',
      \'coc-go',
      \'coc-graphql',
      \'coc-jedi', 
      \'coc-json', 
      \'coc-markdownlint', 
      \'coc-prettier', 
      \'coc-pyright', 
      \'coc-python', 
      \'coc-styled-components', 
      \'coc-tsserver', 
      \'coc-git'
      \]

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

" vim jsx pretty
let g:vim_jsx_pretty_colorful_config = 1

" enable indentguides
let g:indent_guides_enable_on_vim_startup = 1

" Settings for python-mode
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_python = 'python3'

" virtualenv
let g:virtualenv_directory = "~/.venv"
let g:virtualenv_auto_activate = 1

" poet-v
let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 1
let g:poetv_set_environment = 1

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

" pymode settings
let g:pymode = 1 
let g:pymode_indent = 1
let g:pymode_virtualenv = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1

" vim-mix-format settings
let g:mix_format_on_save = 1

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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
