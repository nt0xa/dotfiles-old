" Vundle {{{ "

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" Vundle
Plugin 'gmarik/Vundle.vim'

" Interface
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Editor
Plugin 'tpope/vim-surround'

" Code display
Plugin 'chriskempson/base16-vim'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'

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

" Allow swithing buffers without saving
set hidden

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

" Search while typing
set incsearch

" Highlight search results
set hlsearch

" }}} Search "

" Leader shortcuts {{{ "

" Rebind leader key to space
let mapleader=' '

" (w)rite file
nnoremap <leader>w :w!<cr>

" (q)uit
nnoremap <leader>q :q<cr>

" Make current window the (o)nly on the screen
nnoremap <leader>o :on<cr>

" (u)nload current buffer
nnoremap <leader>u :bd<cr>

" Toggle folding
nnoremap <leader><leader> za

" Clear search pattern
nnoremap <leader>l :let @/ = ""<cr>

" Toggle netrw
nnoremap <leader>n :Explore<cr>

" }}} Leader Shortcuts "

" Shortcuts {{{ "

" Use jj to exit from insert mode
inoremap jj <esc>

" }}} Shortcuts "

" Autocmd {{{ "

" Detect filetypes
filetype plugin on

" Load filetype-specific indent files
filetype indent on

" nvimrc {{{ "

augroup nvimrc
    autocmd!

    " Reload nvimrc after save
    autocmd BufWritePost .nvimrc
        \ source % |
        \ AirlineRefresh

augroup end

" }}} nvimrc "

" Python {{{ "

augroup python
    autocmd!

    " Run python code from vim
    autocmd FileType python
        \ nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>

augroup end

" }}} Python "


" }}} Autocmd "

" Plugin: CtrlP {{{ "

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|coverage\|DS_Store\|git'

" }}} Plugin: CtrlP "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}} Plugin: UltiSnips "

" Plugin: Airline {{{ "

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'

" }}} Plugin: Airline "

" Plugin: YouCompleteMe {{{ "

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" }}} YouCompleteMe "

