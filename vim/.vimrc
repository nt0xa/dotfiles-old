" Plugins {{{ "

call plug#begin('~/.vim/plugged')

" Plugins helpers
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'mattn/webapi-vim'

" Interface
Plug 'bling/vim-airline'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'

" Navigation
Plug 'Lokaltog/vim-easymotion'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'
Plug 'kshenoy/vim-signature'

" Search & replace
Plug 'deris/vim-shot-f'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Editor
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-sleuth'
Plug 'Raimondi/delimitMate'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" Other
Plug 'mhinz/vim-startify'

" Colorscheme
Plug 'chriskempson/base16-vim'

" Linting
Plug 'scrooloose/syntastic'

" Less
Plug 'groenewege/vim-less'

" JavaScript
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'

" HTML
Plug 'mattn/emmet-vim'

" OpenCL
Plug 'petRUShka/vim-opencl'

" Markdown
Plug 'suan/vim-instant-markdown'

call plug#end()

" }}} Plugins "

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
set background=dark
let base16colorspace=256
colorscheme base16-eighties

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

" Plugin: Unite.vim {{{ "

" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Sort matches by rank. The higher the matched word is or
" the longer the matched length is, the higher the rank is.
call unite#filters#sorter_default#use(['sorter_rank'])

" Use ag for recursive file search
let g:unite_source_rec_async_command =
  \ 'ag --follow --nocolor --nogroup --hidden -g ""'

" Use ag for async file search
let g:unite_source_file_async_command =
  \ 'ag --follow --nocolor --nogroup --hidden -g ""'

" Use ag for grep
let g:unite_source_grep_command = 'ag'

" ag for grep params
let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden'

" Like ctrlp.vim settings
call unite#custom#profile('default', 'context', {
  \ 'prompt': '» ',
  \ 'start_insert': 1,
\ })

" Unite filetype settings function
function! s:unite_filetype_settings()

  nmap <buffer> <c-p> <plug>(unite_exit)
  imap <buffer> <c-p> <plug>(unite_exit)

  imap <buffer> <c-j> <plug>(unite_select_next_line)
  imap <buffer> <c-k> <plug>(unite_select_previous_line)

endfunction

" Unite autocmd group
augroup UniteAutocmdGroup
  autocmd!
  autocmd FileType unite call s:unite_filetype_settings()
augroup end

" Mappings
nnoremap <c-p> :Unite file_rec/async<cr>
nnoremap <c-g> :Unite grep:.<cr>
nnoremap <c-b> :Unite buffer<cr>

" }}} Unite.vim "

" Plugin: Vimfiler.vim {{{ "

" Use vimfiler instead of netrw
let g:vimfiler_as_default_explorer = 1

" Disable safe-mode
call vimfiler#custom#profile('default', 'context', {
  \ 'safe' : 0
\ })

" Like Textmate icons
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" Mappings
nnoremap <c-o> :VimFiler -toggle<cr>
inoremap <c-o> <esc>:VimFiler -toggle<cr>

" }}} Plugin: Vimfiler.vim "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}} Plugin: UltiSnips "

" Plugin: Airline {{{ "

let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'

" }}} Plugin: Airline "

" Plugin: YouCompleteMe {{{ "

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1

" }}} YouCompleteMe "

" Plugin: Javascript-libraries-syntax {{{ "

let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,react'

" }}} Plugin: Javascript-libraries-syntax "

" Plugin: Vim-easymotion {{{ "

let g:EasyMotion_do_mapping = 0

nmap s <plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)

" }}} Plugin: Vim-easymotion "

" Plugin: Syntastic {{{ "

" Ignore angular attributes in html
let g:syntastic_html_tidy_ignore_errors = [
  \ " proprietary attribute \"ng-",
  \ " proprietary attribute \"ui-",
\ ]

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠︎'

" JavaScript checkers
let g:syntastic_javascript_checkers = ['eslint']

" }}} Plugin: Syntastic "

" Plugin: Tagbar {{{ "

" Toggle tagbar
nnoremap <c-t> :TagbarToggle<cr>

" }}} Plugin: Tagbar "

" Plugin: Vim-expand-region {{{ "

map <leader>e <plug>(expand_region_expand)
map <leader>s <plug>(expand_region_shrink)

" }}} Plugin: Vim-expand-region "

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
nnoremap <silent> <leader>gs :OverCommandLine<cr>%s/
vnoremap <silent> <leader>s :OverCommandLine<cr>s/

" }}} Plugin: vim-over "

" Plugin: Tabular {{{ "

vnoremap <leader>t :Tab /

" }}} Plugin: Tabular "

" Plugin: vim-jsx {{{ "

" Enable jsx highlighting for js files
let g:jsx_ext_required = 0

" }}} Plugin: vim-jsx "
