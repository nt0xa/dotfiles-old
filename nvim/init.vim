" Plugins {{{ "

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

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

" Colorschemes
Plug 'chriskempson/base16-vim'

" Git
Plug 'tpope/vim-fugitive'

" Linting
Plug 'benekastah/neomake'

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
set wildignore=.git,node_modules,build,dist,*.o,*.a,*.pyc,*.class

" Enable syntax highlighting
syntax enable

" Colorscheme
set background=dark
try
  let base16colorspace=256
  colorscheme base16-eighties
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

" Detect filetypes
filetype plugin on

" Load filetype-specific indent files
filetype indent on

" Enable folding
set foldenable

" }}} Options "

" Vanilla mappings {{{"

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

" }}} Vanilla mappings "

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
  return ' ' . a:str . ' '
endfunction

" }}} Helpers "

" Statusline {{{1 "

" Colors {{{2 "

exec 'hi StatusLineMode_NORMAL   ctermbg=4  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_INSERT   ctermbg=2  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_VISUAL   ctermbg=3  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_V_LINE   ctermbg=3  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_V_BLOCK  ctermbg=3  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_REPLACE  ctermbg=1  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_COMMAND  ctermbg=6  ctermfg=18 cterm=bold'
exec 'hi StatusLineMode_TERMINAL ctermbg=5  ctermfg=18 cterm=bold'
exec 'hi StatusLineMiddle        ctermbg=18 ctermfg=18'
exec 'hi StatusLineFileType      ctermbg=8  ctermfg=18'

" 2}}} Colors "

" Refresh {{{2 "

function! StatusLineBuild(active)
  let l:statusline = ''

  if a:active == 1
    let l:statusline .= '%#StatusLineMode#'
    let l:statusline .= '%{StatusLineMode()}'
    let l:statusline .= '%#StatusLineMiddle#'
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

function! Test()
  redrawstatus
  return ''
endfunction

nnoremap : :<C-\>eTest()<CR>

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
  return ' ' . s:spacewrap(a:modename[0])
endfunction

" 2}}} Mode "

" Branch {{{2 "

function! StatusLineBranch()
  let l:result = ''
  if exists('*fugitive#head')
    let l:result = s:spacewrap(join(['', fugitive#head()]))
    let l:result .= s:StatusLineSeparator('left')
  endif
  return l:result
endfunction

" 2}}} Branch "

" File {{{2 "

function! StatusLineFile()
  let l:fname = expand('%:t')
  let l:result = s:spacewrap(l:fname)
  let l:result .= s:StatusLineSeparator('left')
  return l:result
endfunction

" 2}}} File "

" Filetype {{{2 "

function! StatusLineFileType()
  return '%#StatusLineFileType#' . s:spacewrap(&ft)
endfunction

" 2}}} Filetype "

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

" Plugin: vim-over {{{ "

vnoremap <silent> gR :OverCommandLine<cr>s/\%V
vnoremap <silent> gr :OverCommandLine<cr>s/
nnoremap <silent> gr :OverCommandLine<cr>s/

" }}} Plugin: vim-over "

" Plugin: vim-easy-align {{{ "

vnoremap ga :EasyAlign<space>

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
