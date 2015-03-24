" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ==================
" = General config =
" ==================

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set gcr=a:blinkon0
set visualbell
set autoread
set laststatus=2
set noshowmode
set hidden

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

filetype plugin on
filetype indent on

set nowrap
set linebreak

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ++++++++++++++++
" + Vundle BEGIN +
" ++++++++++++++++

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ================
" = Autocomplete =
" ================

Plugin 'Valloric/YouCompleteMe'

" ============
" = Snippets =
" ============

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

" ===========
" = Airline =
" ===========

Plugin 'bling/vim-airline'

let g:airline_powerline_fonts=1

" ====================
" = Solarized colors =
" ====================

Plugin 'altercation/vim-colors-solarized'

" ++++++++++++++
" + Vundle END +
" ++++++++++++++

call vundle#end()

filetype plugin on
filetype indent on

" ===============
" = Colorscheme =
" ===============

let g:solarized_termcolors=256
set background=dark
colorscheme solarized
