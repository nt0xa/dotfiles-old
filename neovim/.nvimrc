" Vundle {{{ "

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins helpers
Plugin 'Shougo/vimproc.vim'
Plugin 'mattn/webapi-vim'

" Interface
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'majutsushi/tagbar'

" " Navigation
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-rsi'

" Search
Plugin 'Lokaltog/vim-easymotion'
Plugin 'deris/vim-shot-f'
Plugin 'haya14busa/incsearch.vim'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Editor
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'tommcdo/vim-exchange'

" Other
Plugin 'mattn/gist-vim'
Plugin 'thinca/vim-quickrun'

" Colorscheme
Plugin 'chriskempson/base16-vim'

" Linting
Plugin 'scrooloose/syntastic'

" Less
Plugin 'groenewege/vim-less'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'

" OpenCL
Plugin 'petRUShka/vim-opencl'

call vundle#end()

" }}} Vundle "

" UI Config {{{ "

" Show line numbers
set number

" Always show status line
set laststatus=2

" Hide status line at the bottom
set noshowmode

" No sounds
set visualbell

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
set softtabstop=4

" Number of visual spaces per tab
set tabstop=4

" <<, >> spaces
set shiftwidth=4

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

" }}} Mappings "

" Filetype {{{ "

" Detect filetypes
filetype plugin on

" Load filetype-specific indent files
filetype indent on

" }}} Filetype "

" Autocmd: nvimrc {{{ "

if !exists('*s:reload_nvimrc')
    function! s:reload_nvimrc()
        source %
        if exists(':AirlineRefresh')
            AirlineRefresh
        endif
    endfunction
endif

augroup NvimrcAutocmdGroup
    autocmd!
    autocmd BufWritePost .nvimrc call s:reload_nvimrc()
augroup end

" }}} Autocmd: nvimrc "

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

" Autoclose popup after completion
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.nvim/ycm/.ycm_extra_conf.py'
let g:ycm_complete_in_comments  = 1
let g:ycm_seed_identifiers_with_syntax = 1

" }}} YouCompleteMe "

" Plugin: Javascript-libraries-syntax {{{ "

let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

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

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" }}} Plugin: incsearch.vim "
