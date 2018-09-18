scriptencoding utf-8

" Plugins {{{ "

" Auto-install vim-plug
if empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
    !git clone 'https://github.com/junegunn/vim-plug' $XDG_DATA_HOME/nvim/site/autoload
endif

call plug#begin('$XDG_DATA_HOME/nvim/site/plugged')

" Interface
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-projectionist'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'
Plug 'easymotion/vim-easymotion'

" Search & replace
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
" Plug 'brooth/far.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/sideways.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'

" Colorscheme
Plug 'morhetz/gruvbox'

" Linting
Plug 'benekastah/neomake'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'roxma/nvim-yarp'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mattn/emmet-vim'

" By language
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'lifepillar/pgsql.vim'
Plug 'chr4/nginx.vim'
Plug 'chr4/sslsecure.vim'

call plug#end()

" }}} Plugins "

" Options {{{ "

" File encodings
set fileencodings=utf-8,cp1251

" Show line numbers (hybrid)
" set relativenumber
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
set wildignore=.git,.svn,node_modules,dist,build,*.o,*.a,*.pyc,*.class

" Enable syntax highlighting
syntax enable

" Colorscheme
set termguicolors

set background=dark
try
    let g:gruvbox_invert_selection = 0
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" Count of spaces per tab when editing
set softtabstop=4

" Number of visual spaces per tab
set tabstop=4

" <<, >> spaces
set shiftwidth=4

" Use tabs for indent
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:➝\ ,eol:¬

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
set smartcase

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

" Show only menu on completion
set completeopt=menu

" Interactive replace
set inccommand=nosplit

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" }}} Options "

" Colours {{{ "

let s:colours = {
\ 'gui':  {
\         'dark0_hard':     '#1d2021',
\         'dark0':          '#282828',
\         'dark0_soft':     '#32302f',
\         'dark1':          '#3c3836',
\         'dark2':          '#504945',
\         'dark3':          '#665c54',
\         'dark4':          '#7c6f64',
\         'gray_245':       '#928374',
\         'gray_244':       '#928374',
\         'light0_hard':    '#f9f5d7',
\         'light0':         '#fbf1c7',
\         'light0_soft':    '#f2e5bc',
\         'light1':         '#ebdbb2',
\         'light2':         '#d5c4a1',
\         'light3':         '#bdae93',
\         'light4':         '#a89984',
\         'bright_red':     '#fb4934',
\         'bright_green':   '#b8bb26',
\         'bright_yellow':  '#fabd2f',
\         'bright_blue':    '#83a598',
\         'bright_purple':  '#d3869b',
\         'bright_aqua':    '#8ec07c',
\         'bright_orange':  '#fe8019',
\         'neutral_red':    '#cc241d',
\         'neutral_green':  '#98971a',
\         'neutral_yellow': '#d79921',
\         'neutral_blue':   '#458588',
\         'neutral_purple': '#b16286',
\         'neutral_aqua':   '#689d6a',
\         'neutral_orange': '#d65d0e',
\         'faded_red':      '#9d0006',
\         'faded_green':    '#79740e',
\         'faded_yellow':   '#b57614',
\         'faded_blue':     '#076678',
\         'faded_purple':   '#8f3f71',
\         'faded_aqua':     '#427b58',
\         'faded_orange':   '#af3a03',
\     }
\ }

let g:terminal_color_0 = s:colours.gui.dark0
let g:terminal_color_1 = s:colours.gui.neutral_red
let g:terminal_color_2 = s:colours.gui.neutral_green
let g:terminal_color_3 = s:colours.gui.neutral_yellow
let g:terminal_color_4 = s:colours.gui.neutral_blue
let g:terminal_color_5 = s:colours.gui.neutral_purple
let g:terminal_color_6 = s:colours.gui.neutral_aqua
let g:terminal_color_7 = s:colours.gui.gray_245
let g:terminal_color_8 = s:colours.gui.gray_244
let g:terminal_color_9 = s:colours.gui.bright_red
let g:terminal_color_10 = s:colours.gui.bright_green
let g:terminal_color_11 = s:colours.gui.bright_yellow
let g:terminal_color_12 = s:colours.gui.bright_blue
let g:terminal_color_13 = s:colours.gui.bright_purple
let g:terminal_color_14 = s:colours.gui.bright_aqua
let g:terminal_color_15 = s:colours.gui.light0

" }}} Colours "

" Key mappings {{{"

" Rebind leader key to space
let g:mapleader = ' '

" Set localleader
let g:maplocalleader = ','

" Write file
nnoremap <Leader>w :w!<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Only
nnoremap <Leader>o :only<CR>

" Select pasted text
noremap gV `[v`]

" Paste in insert mode
inoremap <C-y> <C-o>p

if has('nvim')
    nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" Quickfix
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprev<CR>

" }}} Key mappings "

" Autocmd: SignColumn {{{ "

function! ShowSignColumn()
    sign define always_shown_sign
    exec 'sign place 9999 line=1 name=always_shown_sign buffer=' . bufnr('')
endfunction

augroup augroup_always_show_sign_column
    autocmd!
    autocmd BufEnter * call ShowSignColumn()
augroup END

" }}} Autocmd: SignColumn "

" Statusline {{{1 "

" Helpers {{{2 "

function! s:spacewrap(str)
    return printf('  %s ', a:str)
endfunction

function! s:titlecase(str)
    return substitute(a:str, '\<\(\w\)\(\w*\)\>', '\u\1\L\2', 'g')
endfunction

function! s:format_hlgroup_name(str)
    return substitute(a:str, '-', '_', 'g')
endfunction

function! s:link_hlgroups(group1, group2)
    exec printf('hi link %s %s', a:group1, a:group2)
endfunction

function! s:link_hlsubgroups(group, subgroup_id)
    let l:hlsubgroup = a:group . '_' . s:format_hlgroup_name(a:subgroup_id)
    call s:link_hlgroups(a:group, l:hlsubgroup)
endfunction

" 2}}} Helpers "

" Refresh {{{2 "

function! StatusLineBuild(active, ...)
    let l:statusline = ''

    if a:active == 1
        let l:statusline .= '%#StatusLineMode#'
        let l:statusline .= '%{StatusLineMode()}'

        let l:statusline .= '%#StatusLineWindowType#'
        let l:statusline .= '%{StatusLineWindowType()}'

        let l:statusline .= '%#StatusLineFile#'
        let l:statusline .= '%{StatusLineFile()}'

        let l:statusline .= '%='

        let l:statusline .= '%#StatusLinePercent#'
        let l:statusline .= ' %p%% '

        let l:statusline .= '%#StatusLinePosition#'
        let l:statusline .= ' %l:%c '

        let l:statusline .= '%#NeomakeErrorSign#'
        let l:statusline .= '%{StatusLineNeomake("E", "✘")}'

        let l:statusline .= '%#NeomakeWarningSign#'
        let l:statusline .= '%{StatusLineNeomake("W", "❢")}'

        let l:statusline .= '%#StatusLineBranch#'
        let l:statusline .= '%{StatusLineBranch()}'
    else
        let l:statusline .= '%#StatusLineWindowType#'
        let l:statusline .= '%{StatusLineWindowType()}'

        let l:statusline .= '%#StatusLineFile#'
        let l:statusline .= '%{StatusLineFile()}'

        let l:statusline .= '%='

        let l:statusline .= '%#StatusLineBranch#'
        let l:statusline .= '%{StatusLineBranch()}'
    endif

    return l:statusline
endfunction

function! StatusLineRefresh(...)
    let l:statuslines = [StatusLineBuild(0), StatusLineBuild(1)]
    for l:nr in range(1, winnr('$'))
        let l:active = (l:nr == winnr())
        call setwinvar(l:nr, '&statusline', l:statuslines[l:active])
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

" Percent {{{

exec 'hi StatusLinePercent'
\   ' guibg=' . s:colours.gui.gray_244 .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLinePosition'
\   ' guibg=' . s:colours.gui.gray_244 .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

" }}} Percent

" Mode {{{2 "

exec 'hi StatusLineMode_NORMAL'
\   ' guibg=' . s:colours.gui.neutral_blue .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_INSERT'
\   ' guibg=' . s:colours.gui.neutral_green .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_VISUAL'
\   ' guibg=' . s:colours.gui.neutral_orange .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_V_LINE'
\   ' guibg=' . s:colours.gui.neutral_orange .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_V_BLOCK'
\   ' guibg=' . s:colours.gui.neutral_orange .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_REPLACE'
\   ' guibg=' . s:colours.gui.neutral_red .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_COMMAND'
\   ' guibg=' . s:colours.gui.neutral_aqua .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

exec 'hi StatusLineMode_TERMINAL'
\   ' guibg=' . s:colours.gui.neutral_purple .
\   ' guifg=' . s:colours.gui.dark0 .
\   ' gui=bold'

function! s:mode2name(mode)
    let l:mode_map = {
    \     'n':      'NORMAL',
    \     'i':      'INSERT',
    \     'R':      'REPLACE',
    \     'v':      'VISUAL',
    \     'V':      'V-LINE',
    \     'c':      'COMMAND',
    \     "\<C-v>": 'V-BLOCK',
    \     's':      'SELECT',
    \     'S':      'S-LINE',
    \     "\<C-s>": 'S-BLOCK',
    \     't':      'TERMINAL',
    \     '?':      ' '
    \ }
    return l:mode_map[a:mode]
endfunction

function! StatusLineMode()
    let l:modename = s:mode2name(mode())
    let l:filetype = &filetype

    let l:hide = l:filetype ==? 'help' ||
    \            l:filetype ==? 'fzf' ||
    \            l:filetype ==? 'qf' ||
    \            l:filetype ==? 'vim-plug' ||
    \            l:filetype ==? 'tagbar'

    if l:hide
        return ''
    endif

    let l:last_modename = get(w:, 'last_modename', '')

    " Highlight is too slow, so rehighlight only if modename is changed.
    if l:modename != l:last_modename
        call s:link_hlsubgroups('StatusLineMode', l:modename)
        let w:last_modename = l:modename
    endif

    return s:spacewrap(l:modename[0])
endfunction

" 2}}} Mode "

" WindowType {{{2 "

exec 'hi StatusLineWindowType_help'
\   ' guibg=' . s:colours.gui.neutral_green .
\   ' guifg=' . s:colours.gui.dark0

exec 'hi StatusLineWindowType_fzf'
\   ' guibg=' . s:colours.gui.neutral_purple .
\   ' guifg=' . s:colours.gui.dark0

exec 'hi StatusLineWindowType_quickfix'
\   ' guibg=' . s:colours.gui.neutral_yellow .
\   ' guifg=' . s:colours.gui.dark0

exec 'hi StatusLineWindowType_plugins'
\   ' guibg=' . s:colours.gui.neutral_aqua .
\   ' guifg=' . s:colours.gui.dark0

exec 'hi StatusLineWindowType_tagbar'
\   ' guibg=' . s:colours.gui.neutral_green .
\   ' guifg=' . s:colours.gui.dark0

function! s:get_window_type(filename, filetype)
    if a:filetype ==? 'help'
        return 'help'
    elseif a:filetype ==? 'fzf'
        return 'fzf'
    elseif a:filetype ==? 'qf'
        return 'quickfix'
    elseif a:filetype ==? 'vim-plug'
        return 'plugins'
    elseif a:filetype ==? 'tagbar'
        return 'tagbar'
    else
        return ''
    endif
endfunction

function! StatusLineWindowType()
    let l:filename = expand('%:t')
    let l:filetype = &filetype
    let l:windowtype = s:get_window_type(l:filename, l:filetype)

    let l:show = l:windowtype ==? 'help' ||
    \            l:windowtype ==? 'fzf' ||
    \            l:windowtype ==? 'quickfix' ||
    \            l:windowtype ==? 'plugins' ||
    \            l:windowtype ==? 'tagbar'

    if l:show
        call s:link_hlsubgroups('StatusLineWindowType', l:windowtype)
        return s:spacewrap(s:titlecase(l:windowtype))
    endif
    return ''
endfunction

" 2}}} WindowType "

" File {{{2 "

exec 'hi StatusLineFile'
\   ' guibg=' . s:colours.gui.dark1 .
\   ' guifg=' . s:colours.gui.light0

function! StatusLineFile()
    let l:filetype = &filetype
    let l:filename = expand('%:t')

    let l:hide = l:filetype ==? 'fzf' ||
    \            l:filetype ==? 'vim-plug' ||
    \            l:filetype ==? 'tagbar'

    if !l:hide
        return s:spacewrap(l:filename)
    endif

    return ''
endfunction

" 2}}} File "

" Neomake {{{2 "

function! StatusLineNeomake(type, sign)

    if !exists('*neomake#statusline#LoclistCounts')
        return ''
    endif

    let l:count = 0

    let l:loclist = neomake#statusline#LoclistCounts()
    if !empty(l:loclist) && has_key(l:loclist, a:type)
        let l:count += l:loclist[a:type]
    endif

    let l:qflist = neomake#statusline#QflistCounts()
    if !empty(l:qflist) && has_key(l:qflist, a:type)
        let l:count += l:qflist[a:type]
    endif

    if l:count
        return printf(' %s %d ', a:sign, l:count)
    endif

    return ''
endfunction

" 2}}} Neomake "

" Branch {{{2 "

exec 'hi StatusLineBranch'
\   ' guibg=' . s:colours.gui.neutral_purple .
\   ' guifg=' . s:colours.gui.dark0

function! StatusLineBranch()

    if !exists('*fugitive#head')
        return ''
    endif

    let l:filetype = &filetype
    let l:branch = fugitive#head()

    let l:hide = empty(l:branch) ||
    \            l:filetype ==? 'help' ||
    \            l:filetype ==? 'tagbar'

    if !l:hide
        return s:spacewrap(l:branch)
    endif

    return ''
endfunction

" 2}}} Branch "

" 1}}} Statusline "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsSnippetDirectories = [$XDG_CONFIG_HOME . '/nvim/UltiSnips']

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" }}} Plugin: UltiSnips "

" Plugin: FZF {{{ "

let &runtimepath.=',' . substitute(system('brew --prefix'), "\n", '', '') . '/opt/fzf'

let g:fzf_layout = { 'down': '~30%' }

" Colors
hi FZF_fg      ctermfg=15
hi FZF_bg      ctermbg=0
hi FZF_hl      ctermfg=3
hi FZF_fg_plus ctermfg=3
hi FZF_bg_plus ctermbg=0
hi FZF_hl_plus ctermbg=3
hi FZF_info    ctermfg=8
hi FZF_prompt  ctermfg=2
hi FZF_pointer ctermfg=4
hi FZF_marker  ctermfg=3
hi FZF_spinner ctermfg=4
hi FZF_header  ctermfg=1

let g:fzf_colors = {
\     'fg':      ['fg', 'FZF_fg'],
\     'bg':      ['bg', 'FZF_bg'],
\     'hl':      ['fg', 'FZF_hl'],
\     'fg+':     ['fg', 'FZF_fg_plus'],
\     'bg+':     ['bg', 'FZF_bg_plus'],
\     'hl+':     ['fg', 'FZF_hl_plus'],
\     'info':    ['fg', 'FZF_info'],
\     'prompt':  ['fg', 'FZF_prompt'],
\     'pointer': ['fg', 'FZF_pointer'],
\     'marker':  ['fg', 'FZF_marker'],
\     'spinner': ['fg', 'FZF_spinner'],
\     'header':  ['fg', 'FZF_header']
\ }

" Go to file (f - file)
nnoremap <Leader>f :Files<CR>

" Go to tag in project (g - goto)
nnoremap <Leader>g :Tags<CR>

" Go to tag in buffer (m - methods)
nnoremap <Leader>m :BTags<CR>

" Search with ag (/ - like vim search)
nnoremap <leader>/ :execute 'Ag ' . input('Ag/')<CR>

" Go to buffer (s - swithch)
nnoremap <Leader>s :Buffers<CR>

" Use common statusline
augroup augroup_fzf_status_line
    autocmd!
    autocmd User FzfStatusLine call StatusLineRefresh()
augroup END

" }}} Plugin: FZF "

" Plugin: Neomake {{{ "

" let g:neomake_verbose = 3
" let g:neomake_logfile = '/Users/russtone/neomake.log'

let g:neomake_open_list = 0

" Signs
let g:neomake_error_sign = {
\     'text':   '✘',
\     'texthl': 'NeomakeErrorSign',
\ }

let g:neomake_warning_sign = {
\     'text':   '❢',
\     'texthl': 'NeomakeWarningSign',
\ }

" Signs colors
exec 'hi NeomakeErrorSign' .
\   ' guibg=' . s:colours.gui.dark1 .
\   ' guifg=' . s:colours.gui.neutral_red .
\   ' gui=bold'

exec 'hi NeomakeWarningSign' .
\   ' guibg=' . s:colours.gui.dark1 .
\   ' guifg=' . s:colours.gui.neutral_yellow .
\   ' gui=bold'

" Check all files on save
augroup augroup_neomake
    autocmd!
    autocmd BufWritePost * Neomake
augroup END

" Vim {{{2 "

let g:neomake_vim_vint_maker = {
\     'args': [
\         '--style-problem',
\         '--enable-neovim',
\         '-f', '{file_path}:{line_number}:{column_number}: {severity}: {description}'
\     ],
\     'errorformat':
\     '%W%f:%l:%c: warning: %m,' .
\     '%W%f:%l:%c: style_problem: %m,' .
\     '%E%f:%l:%c: error: %m,'
\ }

if executable('vint')
    let g:neomake_vim_enabled_makers = ['vint']
endif

" 2}}} Vim "

" HTML {{{ "

let g:neomake_html_enabled_makers = []

" }}} HTML "

" Go {{{2 "

" Disable gometalinter
let g:neomake_go_gometalinter_args = ['--disable-all']

" 2}}} Go "

" }}} Plugin: Neomake "

" Plugin: EasyAlign {{{ "

vnoremap gaa :EasyAlign<Space>
vnoremap gaA :EasyAlign<CR><C-x>

vnoremap ga= :EasyAlign =<CR>
vnoremap ga: :EasyAlign :<CR>
vnoremap ga/ :EasyAlign #<CR>
vnoremap ga\ :EasyAlign<CR><C-x>\\<CR>

" }}} Plugin: EasyAlign "

" Plugin: Surround {{{ "

" Surround with single/double quiote
nmap gs' ysiW'
nmap gs" ysiW"
nmap gs) ysiW)

" }}} Plugin: Surround "

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

" Plugin: Projectionist {{{ "

let g:projectionist_heuristics = {
\ 'CMakeLists.txt': {
\     'src/*.c': {
\         'type': 'source',
\         'alternate': 'include/{}.h',
\     },
\     'include/*.h': {
\         'type': 'header',
\         'alternate': 'src/{}.c',
\     },
\     '*': {
\         'make': 'make -C build',
\     },
\ }}

augroup augroup_projectionist
    autocmd!
    autocmd User ProjectionistActivate call NeomakeProjectLint()
augroup END

function! NeomakeProjectLint() abort
    if len(projectionist#query('make'))
        augroup augroup_neomake
            autocmd!
            autocmd BufWritePost * Neomake!
        augroup END
    endif
endfunction

" }}} Plugin: Projectionist "

" Plugin: Deoplete {{{ "

inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" : "\<Tab>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 10

" Clang {{{2 "

let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/include'

let g:deoplete#sources#clang#flags = [
\ '-I', './include',
\ '-I', './.deps/usr/include',
\ '-I', '/usr/local/include',
\ '-I', '/usr/include',
\ '-I', '/usr/local/opt/openssl/include'
\ ]

 " 2}}} Clang "

" }}} Plugin: Deoplete "

" Plugin: Tagbar {{{ "

nnoremap <Leader>t :TagbarToggle<CR>

" Status line
let g:tagbar_status_func = 'StatusLineBuild'

" }}} Plugin: Tagbar "

" Plugin: Incsearch {{{ "

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

let g:incsearch#auto_nohlsearch = 1

map n <Plug>(incsearch-nohl-n)zv
map N <Plug>(incsearch-nohl-N)zv

let g:incsearch_cli_key_mappings = {
\     "\<Tab>": {
\         'key': '<Over>(buffer-complete)',
\         'noremap': 1
\     },
\     "\<C-n>": '<Over>(buffer-complete)',
\     "\<C-p>": '<Over>(buffer-complete-prev)',
\ }

" }}} Plugin: Incsearch "

" Plugin: Over {{{ "

vnoremap <silent> gR :OverCommandLine<CR>s/\%V
vnoremap <silent> gr :OverCommandLine<CR>s/
nnoremap <silent> gr :OverCommandLine<CR>s/

" }}} Plugin: Over "

" Plugin: Ranger {{{ "

let g:ranger_path = 'ranger'

function! OpenRanger(path)
    let l:path = expand(a:path)
    let l:tmpfile = tempname()
    let l:curfile = expand('%:p')
    let l:callback = {
    \ 'name': 'ranger',
    \ 'tmpfile': l:tmpfile,
    \ 'curfile': l:curfile,
    \ 'curfile_existed': filereadable(l:curfile),
    \ 'curbufnr': bufnr('%'),
    \ }

    function! l:callback.on_exit(id, code, event)
        bdelete!

        if l:self.curfile_existed &&
        \ !filereadable(l:self.curfile)
            exec 'bdelete ' . l:self.curbufnr
        endif

        set hidden

        " Open selected files
        if filereadable(l:self.tmpfile)
            for l:fpath in readfile(l:self.tmpfile)
                exec 'edit '. l:fpath
            endfor
            call delete(l:self.tmpfile)
        endif
    endfunction

    write
    set nohidden
    enew

    let l:command = g:ranger_path .
    \ ' --choosefiles=' . shellescape(l:tmpfile) .
    \ (isdirectory(l:path) ? shellescape(l:path) : ' --selectfile=' . shellescape(l:path))

    call termopen(l:command, l:callback)
    startinsert
endfunction

" Start ranger in current buffer directory (d - directory)
nnoremap <Leader>d :call OpenRanger('%:p')<CR>

augroup augroup_terminal
    autocmd!
    autocmd TermOpen * setlocal nolist
augroup END

" }}} Plugin: Ranger "

" Plugin: Sideways {{{ "

nnoremap gh :SidewaysLeft<CR>
nnoremap gl :SidewaysRight<CR>

" }}} Plugin: Sideways "

" Plugin: Emmet {{{ "

let g:user_emmet_leader_key=','

" }}} Plugin: Emmet "

" Indent {{{ "

augroup augroup_ident
    autocmd!
    autocmd Filetype go setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype stylus setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype pug setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype sh setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" }}} Indent "

" Filetypes {{{ "

augroup augroup_filetype
    autocmd!
    autocmd BufNewFile,BufRead *.heml set filetype=html
    autocmd BufNewFile,BufRead *.ksy set filetype=yaml
    autocmd BufNewFile,BufRead .babelrc,.postcssrc,.lessrc,.eslintrc set filetype=yaml
    autocmd BufNewFile,BufRead *.m set filetype=objc
    autocmd BufNewFile,BufRead *.conf set syntax=nginx
    autocmd BufNewFile,BufRead *.sage set syntax=python
augroup END

" }}} Filetypes "

" Language: Go {{{ "

" vim-go
let g:go_term_enabled = 1
let g:go_term_mode = 'split'

augroup augroup_golang
    autocmd!
    autocmd Filetype go call SetGolangOptions()
augroup END

function! SetGolangOptions()
    nnoremap <Localleader>b :GoBuild<CR>
    nnoremap <Localleader>r :GoRename<CR>
    nnoremap <Localleader>i :GoImports<CR>
    nnoremap <Localleader>t :GoTest<CR>
    nnoremap <Localleader>a :GoAlternate<CR>
    nnoremap <Localleader>B :GoTestCompile<CR>
endfunction

" }}} Language: Go "

" Language: Java {{{ "

let g:JavaComplete_EnableDefaultMappings = 0

augroup augroup_java
    autocmd!
    autocmd Filetype java call SetJavaOptions()
augroup END

function! SetJavaOptions()
    nmap <Localleader>i <Plug>(JavaComplete-Imports-AddMissing)
    nmap <Localleader>r <Plug>(JavaComplete-Imports-RemoveUnused)
    nmap <Localleader>I <Plug>(JavaComplete-Imports-Add)
endfunction

" }}} Language: Java "

" Language: SQL {{{ "

let g:sql_type_default = 'pgsql'

" }}} Language: SQL "

" vim: fdm=marker
