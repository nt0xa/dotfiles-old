" Vundle {{{ "

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" Vundle
Plugin 'gmarik/Vundle.vim'

" Interface
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Editor
Plugin 'tpope/vim-surround'

" Code display
Plugin 'altercation/vim-colors-solarized'

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

" }}} UI Config "

" Colors & syntax {{{ "

" Enable syntax highlighting
syntax on

" Color scheme
set background=dark
colorscheme solarized

" Remove folding underline
highlight Folded cterm=none

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

" Folding {{{ "

" Enable folding
set foldenable

" Indent-based folding
set foldmethod=indent

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

" Leader shortcuts {{{ "

" Rebind leader key to space
let mapleader=" "

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
        \ setlocal foldmethod=marker |
        \ AirlineRefresh

    " Fold with markers in nvimrc
    autocmd BufEnter .nvimrc
        \ setlocal foldmethod=marker

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" }}} Plugin: CtrlP "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" }}} Plugin: UltiSnips "

" Plugin: Airline {{{ "

let g:airline_powerline_fonts=1

" }}} Plugin: Airline "

" Plugin: NERDTree {{{ "

map <c-n> :NERDTreeToggle<cr>
let g:NERDTreeIgnore=['.git']
let g:NERDTreeShowHidden=1

" }}} NERDTree "

" Plugin: YouCompleteMe {{{ "

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" }}} YouCompleteMe "

