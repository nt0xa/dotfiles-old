" Remove vi old behavior
set nocompatible
filetype off

" ===========
" = Plugins =
" ===========

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" Vundle
Plugin 'gmarik/Vundle.vim'

" Interface
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Code display
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" ===========
" = General =
" ===========

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc,.nvimrc source % | AirlineRefresh

" Enable filetype plugin and indent
filetype plugin on
filetype indent on
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" 1) Buffer can be put to the background without writing to disk
" 2) When a background buffer becomes current again, marks and undo-history are remembered
set hidden

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2

" Turn off error beeping and flashing
set visualbell
set t_vb=

" Rebind leader key to space
let mapleader=" "

" =========================
" = Hisory, backups, swap =
" =========================

" Useful settings
set history=1000
set undolevels=1000

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" ==============
" = Appearance =
" ==============

" Show line numbers
set number

" Always show status line
set laststatus=2

" Hide status line at the bottom
set noshowmode

" Colorscheme
set background=dark
colorscheme solarized

" ===================================
" = Intendation, wrapping, trailing =
" ===================================

" Each indentation level is 4 spaces
set shiftwidth=4
set softtabstop=4

" Use spaces instead of tab
set expandtab

" Copy intendation from previous line
set autoindent

" Automatically inserts one extra level of indentation in some cases
set smartindent

" Disable line breaking
set nowrap

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ====================
" = Plugins settings =
" ====================

" CrtlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Airline
let g:airline_powerline_fonts=1

" ================
" = Key bindings =
" ================

" -- NORMAL MODE --

" (w)rite file
nnoremap <leader>w :w!<cr>

" (q)uit
nnoremap <leader>q :q<cr>

" Make current window the (o)nly on the screen
nnoremap <leader>o :on<cr>

" (u)nload current buffer
nnoremap <leader>u :bd<cr>
