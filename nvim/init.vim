" Plugins {{{ "

" Auto-install vim-plug
if empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('$XDG_DATA_HOME/nvim/site/plugged')

" Interface
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'

" Search & replace
Plug 'osyo-manga/vim-over'
Plug 'easymotion/vim-easymotion'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" Git
Plug 'tpope/vim-fugitive'

" Linting
Plug 'benekastah/neomake'

" By language
Plug 'fatih/vim-go'

call plug#end()

" }}} Plugins "

" Options {{{ "

" File encodings
set fileencodings=utf-8,cp1251

" Show line numbers (hybrid)
set relativenumber
set number

" Always show status line
set laststatus=2

" Hide status line at the bottom
set noshowmode

" Allow switching buffers without saving
set hidden

" Enable mouse
set mouse=a

" This will cause all yank/delete/paste operations to use the system register *
set clipboard=unnamed,unnamedplus

" Show incomplete commands
set showcmd

" Wildignore
set wildignore=.git,node_modules,dist,*.o,*.a,*.pyc,*.class

" Enable syntax highlighting
syntax enable

" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
try
  let g:gruvbox_invert_selection = 0
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry

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

" Don't wrap lines
set nowrap

" Count of remembered commands
set history=1000

" Count of undo
set undolevels=1000

" Disable backup files
set nobackup
set nowritebackup

" Disable swap files
set noswapfile

" Case insensitive search
set ignorecase

" Highlight matches
set hlsearch

" Seach while typing
set incsearch

" Enable modelines
set modeline

" Detect filetypes
filetype plugin on

" Load filetype-specific indent files
filetype indent on

" Enable folding
set foldenable

" }}} Options "

" Colours {{{ "

let s:colours = {
      \ "gui": {
      \   "dark0_hard":     "#1d2021",
      \   "dark0":          "#282828",
      \   "dark0_soft":     "#32302f",
      \   "dark1":          "#3c3836",
      \   "dark2":          "#504945",
      \   "dark3":          "#665c54",
      \   "dark4":          "#7c6f64",
      \   "gray_245":       "#928374",
      \   "gray_244":       "#928374",
      \   "light0_hard":    "#f9f5d7",
      \   "light0":         "#fbf1c7",
      \   "light0_soft":    "#f2e5bc",
      \   "light1":         "#ebdbb2",
      \   "light2":         "#d5c4a1",
      \   "light3":         "#bdae93",
      \   "light4":         "#a89984",
      \   "bright_red":     "#fb4934",
      \   "bright_green":   "#b8bb26",
      \   "bright_yellow":  "#fabd2f",
      \   "bright_blue":    "#83a598",
      \   "bright_purple":  "#d3869b",
      \   "bright_aqua":    "#8ec07c",
      \   "bright_orange":  "#fe8019",
      \   "neutral_red":    "#cc241d",
      \   "neutral_green":  "#98971a",
      \   "neutral_yellow": "#d79921",
      \   "neutral_blue":   "#458588",
      \   "neutral_purple": "#b16286",
      \   "neutral_aqua":   "#689d6a",
      \   "neutral_orange": "#d65d0e",
      \   "faded_red":      "#9d0006",
      \   "faded_green":    "#79740e",
      \   "faded_yellow":   "#b57614",
      \   "faded_blue":     "#076678",
      \   "faded_purple":   "#8f3f71",
      \   "faded_aqua":     "#427b58",
      \   "faded_orange":   "#af3a03",
      \ }
      \ }

" }}} Colours "

" Key mappings {{{"

" Rebind leader key to space
let mapleader=' '

" Use jk to exit from insert mode
inoremap jk <Esc>

" Write file
nnoremap <Leader>w :w!<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Select pasted text
noremap gV `[v`]

" Paste in insert mode
inoremap <C-y> <C-o>p

" Disable hlsearch
nnoremap <Leader>l :<C-u>nohlsearch<CR>

" }}} Key mappings "

" Autocmd: SignColumn {{{ "

function! s:ShowSignColumn()
  sign define always_shown_sign
  exec 'sign place 9999 line=1 name=always_shown_sign buffer=' . bufnr('')
endfunction

augroup augroup_always_show_sign_column
  autocmd!
  autocmd BufEnter * call s:ShowSignColumn()
augroup END

" }}} Autocmd: SignColumn "

" Helpers {{{ "

function! s:mode2name(mode)
  let l:mode_map = {
        \ 'n': 'NORMAL',
        \ 'i': 'INSERT',
        \ 'R': 'REPLACE',
        \ 'v': 'VISUAL',
        \ 'V': 'V-LINE',
        \ 'c': 'COMMAND',
        \ "\<C-v>": 'V-BLOCK',
        \ 's': 'SELECT',
        \ 'S': 'S-LINE',
        \ "\<C-s>": 'S-BLOCK',
        \ 't': 'TERMINAL',
        \ '?': ' '
        \ }
  return mode_map[a:mode]
endfunction

function! s:spacewrap(str)
  return printf('  %s ', a:str)
endfunction

" }}} Helpers "

" Statusline {{{1 "

" Colors {{{2 "

exec 'hi StatusLineMode_NORMAL   guibg=' . s:colours.gui.neutral_blue .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_INSERT   guibg=' . s:colours.gui.neutral_green .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_VISUAL   guibg=' . s:colours.gui.neutral_orange .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_V_LINE   guibg=' . s:colours.gui.neutral_orange .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_V_BLOCK   guibg=' . s:colours.gui.neutral_orange .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_REPLACE   guibg=' . s:colours.gui.neutral_red .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_COMMAND   guibg=' . s:colours.gui.neutral_aqua .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMode_TERMINAL   guibg=' . s:colours.gui.neutral_purple .
      \ '  guifg=' . s:colours.gui.dark0 . ' gui=bold'
exec 'hi StatusLineMiddle   guibg=' . s:colours.gui.dark1 .
      \ '  guifg=' . s:colours.gui.light0
exec 'hi StatusLineBranch   guibg=' . s:colours.gui.neutral_green .
      \ '  guifg=' . s:colours.gui.dark0

" 2}}} Colors "

" Refresh {{{2 "

function! StatusLineBuild(active)
  let l:statusline = ''

  if a:active == 1
    let l:statusline .= '%#StatusLineMode#'
    let l:statusline .= '%{StatusLineMode()}'
    let l:statusline .= '%#StatusLineMiddle#'
    let l:statusline .= '%{StatusLineFile()}'
    let l:statusline .= '%='
    let l:statusline .= '%#StatusLineBranch#'
    let l:statusline .= '%{StatusLineBranch()}'
  else
  endif

  return l:statusline
endfunction

function! StatusLineRefresh()
  let l:statuslines = [StatusLineBuild(0), StatusLineBuild(1)]
  for nr in range(1, winnr('$'))
    let l:active = (nr == winnr())
    call setwinvar(nr, '&statusline', l:statuslines[l:active])
  endfor
endfunction

augroup augroup_status_line
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call StatusLineRefresh()
augroup end

function! RedrawStatus()
  redrawstatus
  return ''
endfunction

nnoremap : :<C-\>eRedrawStatus()<CR>

" 2}}} Refresh "

" Mode {{{2 "

function! StatusLineMode()
  let l:modename = s:mode2name(mode())
  let l:filename = expand('%:t')
  let l:filetype = &ft

  if !StatusLineModeHide(l:filename, l:filetype)
    call StatusLineModeColor(l:modename)
    return StatusLineModeText(l:modename)
  endif

  return ''
endfunction

function! StatusLineModeHide(filename, filetype)
  return a:filetype ==# 'help'
endfunction

function! StatusLineModeColor(modename)
  let l:hlsuffix = substitute(a:modename, '-', '_', 'g')
  exec 'hi link StatusLineMode StatusLineMode_' . l:hlsuffix
endfunction

function! StatusLineModeText(modename)
  return s:spacewrap(a:modename[0])
endfunction

" 2}}} Mode "

" File {{{2 "

function! StatusLineFile()
  return s:spacewrap(expand('%:t'))
endfunction

" 2}}} File "

" Branch {{{2 "

function! StatusLineBranch()
  let l:filename = expand('%:t')
  let l:filetype = &ft
  if !StatusLineBranchHide(l:filename, l:filetype)
    return StatusLineBranchText()
  endif
  return ''
endfunction

function! StatusLineBranchHide(filename, filetype)
  return !exists('*fugitive#head') || a:filetype ==# 'help'
endfunction

function! StatusLineBranchText()
  return s:spacewrap(join(['', fugitive#head()]))
endfunction

" 2}}} Branch "

" 1}}} Statusline "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}} Plugin: UltiSnips "

" Plugin: FZF {{{ "

set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'down': '~30%' }

" Go to file
nnoremap <Leader>f :Files<CR>

" Go to tag in project
nnoremap <Leader>g :Tags<CR>

" Go to tag in buffer
nnoremap <Leader>e :BTags<CR>

" Search with ag
nnoremap <leader>/ :execute 'Ag ' . input('Ag/')<CR>

" Go to buffer
nnoremap <Leader>c :Buffers<CR>

" }}} Plugin: FZF "

" Plugin: Neomake {{{ "

let g:neomake_open_list = 0

" Signs
let g:neomake_error_sign = {
      \ 'text': '✘',
      \ 'texthl': 'NeomakeErrorSign',
      \ }

let g:neomake_warning_sign = {
      \ 'text': '❢',
      \ 'texthl': 'NeomakeWarningSign',
      \ }

" Signs colors
exec 'hi NeomakeErrorSign' .
      \ ' guibg=' . s:colours.gui.dark1 .
      \ ' guifg=' . s:colours.gui.neutral_red .
      \ ' gui=bold'

exec 'hi NeomakeWarningSign' .
      \ ' guibg=' . s:colours.gui.dark1 .
      \ ' guifg=' . s:colours.gui.neutral_yellow .
      \ ' gui=bold'

" Check all files on save
augroup augroup_neomake
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

" }}} Plugin: Neomake "

" Plugin: vim-over {{{ "

vnoremap <silent> gR :OverCommandLine<CR>s/\%V
vnoremap <silent> gr :OverCommandLine<CR>s/
nnoremap <silent> gr :OverCommandLine<CR>s/

" }}} Plugin: vim-over "

" Plugin: vim-easy-align {{{ "

vnoremap ga :EasyAlign<Space>

" }}} Plugin: vim-easy-align "

" Plugin: vim-surround {{{ "

" Surround with single/double quiote
nmap g' ysiW'
nmap g" ysiW"

" }}} Plugin: vim-surround "

" Plugin: EasyMotion {{{ "

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Press 2 keystrokes and jump
nmap s <Plug>(easymotion-overwin-f2)

" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" }}} Plugin: EasyMotion "

" vim: fdm=marker
