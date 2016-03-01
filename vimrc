" Plugins {{{ "

call plug#begin('~/.vim/plugged')

" Plugins helpers
Plug 'mattn/webapi-vim'
Plug 'xolox/vim-misc'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTree', 'NERDTreeToggle' ] }
Plug 'ryanoasis/vim-devicons'

" Navigation
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'

" Search & replace
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'unblevable/quick-scope'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Editor
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'jiangmiao/auto-pairs'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'

" Colorschemes
Plug 'chriskempson/base16-vim'

" Wiki
Plug 'vimwiki/vimwiki'

" Git
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" Linting
Plug 'scrooloose/syntastic'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'digitaltoad/vim-jade', { 'for': 'html' }
Plug 'tmhedberg/matchit', { 'for': 'html' }

" Markdown
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Go
Plug 'fatih/vim-go', { 'for': 'go' }

" Python
Plug 'hdima/python-syntax', { 'for': 'python' }

" C/C++
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'c', 'cpp' ] }
Plug 'rhysd/vim-clang-format', { 'for': [ 'c', 'cpp' ] }
Plug 'petRUShka/vim-opencl', { 'for': [ 'c', 'cpp' ] }

" Smali
Plug 'kelwin/vim-smali', { 'for': 'smali' }

call plug#end()

" }}} Plugins "

" Encoding {{{ "

set fileencodings=utf-8,cp1251

" }}} Encoding "

" UI Config {{{ "

" Show line numbers
set relativenumber

" Always show status line
set laststatus=2

" Hide status line at the bottom
set noshowmode

" Allow switching buffers without saving
set hidden

" Enable mouse
set mouse=a

" This will cause all yank/delete/paste operations to use the system register *
set clipboard=unnamed

" Show incomplete commands
set showcmd

" Wildignore
set wildignore=.git,node_modules,build,dist,*.o,*.a,*.pyc,*.class

" }}} UI Config "

" Colors & syntax {{{ "

" Enable syntax highlighting
syntax on

" Color scheme
set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-flat

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

" Marker-based folding
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

" Select pasted text
noremap gV `[v`]

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
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c = '%t'
let g:airline_theme="base16"

" }}} Plugin: Airline "

" Plugin: CrtlP {{{ "

" CtrlP extensions
let g:ctrlp_extensions = ['tag', 'buffertag']

" Search in buffer tags
nnoremap <c-t> :CtrlPTag<cr>
nnoremap <c-e> :CtrlPBufTag<cr>
nnoremap <c-m> :CtrlPBuffer<cr>

let g:ctrlp_prompt_mappings = {
\ 'PrtBS()':              ['<bs>', '<c-]>'],
\ 'PrtDelete()':          ['<del>'],
\ 'PrtDeleteWord()':      ['<c-w>'],
\ 'PrtClear()':           ['<c-u>'],
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
\ 'PrtHistory(-1)':       [''],
\ 'PrtHistory(1)':        [''],
\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
\ 'AcceptSelection("t")': ['<c-t>'],
\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
\ 'ToggleFocus()':        ['<s-tab>'],
\ 'ToggleRegex()':        ['<c-r>'],
\ 'ToggleByFname()':      ['<c-d>'],
\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
\ 'PrtExpandDir()':       ['<tab>'],
\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
\ 'PrtInsert()':          ['<c-\>'],
\ 'PrtCurStart()':        ['<c-a>'],
\ 'PrtCurEnd()':          ['<c-e>'],
\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
\ 'PrtCurRight()':        ['<c-l>', '<right>'],
\ 'PrtClearCache()':      ['<F5>'],
\ 'PrtDeleteEnt()':       ['<F7>'],
\ 'CreateNewFile()':      ['<c-y>'],
\ 'MarkToOpen()':         ['<c-z>'],
\ 'OpenMulti()':          ['<c-o>'],
\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-p>'],
\ }


" }}} Plugin: CrtlP "

" Plugin: YouCompleteMe {{{ "

let g:ycm_key_detailed_diagnostics = ''
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<c-x><c-o>'
" let g:ycm_show_diagnostics_ui = 0

" Autocomplete triggers
let g:ycm_semantic_triggers = {
\   'css': [ 're!^\s{2}', 're!:\s+' ],
\   'less': [ 're!^\s{2,}', 're!:\s+' ],
\   'stylus': [ 're!^\s{2,}', 're!:\s+' ]
\ }

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

" JS
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0

" }}} Plugin: syntastic "

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

" Plugin: NERDTree {{{ "

let g:NERDTreeMapMenu = ','
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeMinimalUI = 1
map <leader><leader> :NERDTreeToggle<cr>

" }}} Plugin: NERDTree "

" Plugin: vim-quick-scope {{{ "

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" }}} Plugin: vim-quick-scope "

" Plugin: vim-easytags {{{ "

" Create tags file in project dir (instead of file dir)
set cpo+=d

" Tags file name '.tags' in project dir
set tags=./.tags

" No global tags file
let g:easytags_file = ''

" Create tags file if not exist
let g:easytags_dynamic_files = 2

" Disable auto update tags file (manual update)
let g:easytags_on_cursorhold = 0
let g:easytags_always_enabled = 0
let g:easytags_events = []

" Mapping for manual tags update
nnoremap <leader>t :UpdateTags<cr>

" }}} Plugin: vim-easytags "

" Plugin: python-syntax {{{ "

let g:python_highlight_all = 1

" }}} Plugin: python-syntax "

" Plugin: vimwiki {{{ "

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.css_name = '~/vimwiki/style.css'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'make': 'make'}
let g:vimwiki_list = [wiki]

" }}} Plugin: vimwiki "

" Plugin: vim-instant-markdown {{{ "

let g:instant_markdown_autostart = 0

" }}} Plugin: vim-instant-markdown "

" Plugin: vim-less {{{ "

augroup LessAutocmd
  autocmd!
  autocmd FileType less nnoremap <leader>l :w <bar> !lessc % > %:gs?less?css?:p<cr><space>
  autocmd FileType less set omnifunc=csscomplete#CompleteCSS
augroup END

" }}} Plugin: vim-less "

" Plugin: vim-stylus {{{ "

augroup StylusAutocmd
  autocmd!
  autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
augroup END

" }}} Plugin: vim-stylus "

" Plugin: vim-easyclip {{{ "

let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

nmap <leader>cf <plug>EasyClipToggleFormattedPasten

" }}} Plugin: vim-easyclip "

" Plugin: tagbar {{{ "

" Toggle tagbar
nnoremap <leader>e :TagbarToggle<cr>

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

" Plugin: vim-ag {{{ "

nnoremap <c-g> :Ag<space>

" }}} Plugin: vim-ag "

" Plugin: vim-clang-format {{{ "

let g:clang_format#code_style = 'google'

" Common style options
let g:clang_format#style_options = {
\ }

" Filetype specific options
let g:clang_format#filetype_style_options = {
\   'cpp' : {
\   },
\   'c' : {
\   },
\ }

" }}} Plugin: vim-clang-format "
