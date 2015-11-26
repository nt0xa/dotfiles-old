" Plugins {{{ "

call plug#begin('~/.vim/plugged')

" Plugins helpers
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'mattn/webapi-vim'

" Interface
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'

" Navigation
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'
Plug 'unblevable/quick-scope'

" Search & replace
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'gabesoft/vim-ags'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" Editor
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'PeterRincker/vim-argumentative'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'

" Run
Plug 'thinca/vim-quickrun'

" Wiki
Plug 'vimwiki/vimwiki'

" Git
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'google/vim-colorscheme-primary'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim'}

" Linting
Plug 'scrooloose/syntastic'

" Less
Plug 'groenewege/vim-less'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'

" HTML
Plug 'mattn/emmet-vim'

" OpenCL
Plug 'petRUShka/vim-opencl'

" Markdown
Plug 'suan/vim-instant-markdown'

" Go
Plug 'fatih/vim-go'

" Python
Plug 'hdima/python-syntax'

" C
Plug 'NLKNguyen/c-syntax.vim'

call plug#end()

" }}} Plugins "

" Encoding {{{ "

set fileencodings=utf-8,cp1251

" }}} Encoding "

" UI Config {{{ "

" Show line numbers
set number

" Always show status line
set laststatus=2

" Hide status line at the bottom
set noshowmode

" Allow switching buffers without saving
set hidden

" Enable mouse
set mouse=a

" }}} UI Config "

" Colors & syntax {{{ "

" Enable syntax highlighting
syntax on

" Color scheme
set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-monokai

" }}} Colors & syntax "

" Spaces & tabs {{{ "

" Count of spaces per tab when editing
set softtabstop=2

" Number of visual spaces per tab
set tabstop=2

" <<, >> spaces
set shiftwidth=2

" Tabs are spaces
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Mouse and backspace
set backspace=indent,eol,start

" }}} Spaces & tabs "

" Lines wrapping {{{ "

set nowrap

" }}} Lines wrapping "

" Folding {{{ "

" Enable folding
set foldenable

" Indent-based folding
set foldmethod=marker

" }}} Folding "

" History & backups {{{ "

" Count of remembered commands
set history=1000

" Count of undo
set undolevels=1000

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" }}} History & backups "

" Search {{{ "

" Case insensitive search
set ignorecase

" Highlight matches
set hlsearch

" }}} Search "

" Mappings {{{"

" Rebind leader key to space
let mapleader=' '

" Use jj to exit from insert mode
inoremap jj <esc>

" Write file
nnoremap <leader>w :w!<cr>

" Quit
nnoremap <leader>q :q<cr>

" Toggle folding
nnoremap <leader>f za

" Clear search pattern (remove highlighting)
nnoremap <silent> <leader>l :let @/ = ''<cr>

" Copy/Paste clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Select pasted text
noremap gV `[v`]

" Add new line w/o switching to insert mode
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

" }}} Mappings "

" Filetype {{{ "

" Detect filetypes
filetype plugin on

" Load filetype-specific indent files
filetype indent on

" }}} Filetype "

" Autocmd: vimrc {{{ "

if !exists('*s:reload_vimrc')
  function! s:reload_vimrc()
    source %
    if exists(':AirlineRefresh')
      AirlineRefresh
    endif
  endfunction
endif

augroup VimrcAutocmdGroup
  autocmd!
  autocmd BufWritePost .vimrc call s:reload_vimrc()
augroup end

" }}} Autocmd: vimrc "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}} Plugin: UltiSnips "

" Plugin: Airline {{{ "

let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'

" }}} Plugin: Airline "

" Plugin: CrtlP {{{ "

" Ignored folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|dist'

" CtrlP extensions
let g:ctrlp_extensions = ['tag']

" Search in buffer tags
nnoremap <c-e> :CtrlPTag<cr>

" Go to defenttion using ctrlp
" nmap <c-]> <c-e><c-\>w

" }}} Plugin: CrtlP "

" Plugin: YouCompleteMe {{{ "

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" }}} YouCompleteMe "

" Plugin: javascript-libraries-syntax {{{ "

let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,react'

" }}} Plugin: javascript-libraries-syntax "

" Plugin: syntastic {{{ "

" Ignore angular attributes in html
let g:syntastic_html_tidy_ignore_errors = [
\  " proprietary attribute \"ng-",
\  " proprietary attribute \"ui-",
\]

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠︎'

" JavaScript checkers
let g:syntastic_javascript_checkers = ['eslint']

" }}} Plugin: syntastic "

" Plugin: tagbar {{{ "

" Toggle tagbar
nnoremap <c-t> :TagbarToggle<cr>

" Tags for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" }}} Plugin: tagbar "

" Plugin: incsearch.vim {{{ "

" Use incsearch instead default search
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)

" Auto disable highlighting
let g:incsearch#auto_nohlsearch = 1
map n  <plug>(incsearch-nohl-n)
map N  <plug>(incsearch-nohl-N)
map *  <plug>(incsearch-nohl-*)
map #  <plug>(incsearch-nohl-#)

" }}} Plugin: incsearch.vim "

" Plugin: vim-over {{{ "

nnoremap <silent> <leader>s :OverCommandLine<cr>s/
vnoremap <silent> <leader>s :OverCommandLine<cr>s/
nnoremap <silent> <leader>gs :OverCommandLine<cr>%s/

" }}} Plugin: vim-over "

" Plugin: vim-easy-align {{{ "

vnoremap <leader>a :EasyAlign<space>

" }}} Plugin: vim-easy-align "

" Plugin: vim-jsx {{{ "

" Enable jsx highlighting for js files
let g:jsx_ext_required = 0

" }}} Plugin: vim-jsx "

" Plugin: vim-quickrun {{{ "

let g:quickrun_config = {
\  "_" : {
\    "runner" : "vimproc",
\    "runner/vimproc/updatetime" : 10,
\    "outputter/buffer/split" : ":botright 8sp"
\  },
\}

" }}} Plugin: vim-quickrun "

" Plugin: NERDTree {{{ "

map <leader>n :NERDTreeToggle<cr>

" }}} Plugin: NERDTree "

" Plugin: vim-quick-scope {{{ "

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" }}} Plugin: vim-quick-scope "

" Plugin: vim-easytags {{{ "

set cpo+=d
set tags=./.git/tags
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_python_enabled = 1

" }}} Plugin: vim-easytags "

" Plugin: python-syntax {{{ "

let g:python_highlight_all = 1

" }}} Plugin: python-syntax "
