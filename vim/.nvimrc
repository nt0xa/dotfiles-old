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

" Editor
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Appearance
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" Python
Plugin 'klen/python-mode'

" ===========
" = General =
" ===========

" Enable filetype plugin and indent
filetype plugin on
filetype indent on

" Turn off error beeping and flashing
set visualbell
set t_vb=

" Set to auto read when a file is changed from the outside
set autoread

" 1) Buffer can be put to the background without writing to disk
" 2) When a background buffer becomes current again, marks and undo-history are remembered
set hidden

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set gcr=a:blinkon0
set laststatus=2
set noshowmode

syntax on

let mapleader="/<Space>"

" ===============
" = Indentation =
" ===============

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set nowrap
set linebreak

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ===============
" = Colorscheme =
" ===============

set background=dark
colorscheme solarized

let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"


let g:airline_powerline_fonts=1

