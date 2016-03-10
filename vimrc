" Plugins {{{ "

call plug#begin('~/.vim/plugged')

" Plugins helpers
Plug 'mattn/webapi-vim'
Plug 'xolox/vim-misc'

" Interface
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTree', 'NERDTreeToggle' ] }
Plug 'ryanoasis/vim-devicons'

" Navigation
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rsi'

" Search & replace
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'unblevable/quick-scope'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Editor
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'jiangmiao/auto-pairs'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'

" Colorschemes
Plug 'chriskempson/base16-vim'

" Wiki
Plug 'vimwiki/vimwiki'

" Git
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" Linting
Plug 'scrooloose/syntastic'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'digitaltoad/vim-jade', { 'for': 'html' }
Plug 'tmhedberg/matchit', { 'for': 'html' }

" Markdown
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Toml
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Go
Plug 'fatih/vim-go', { 'for': 'go' }

" Python
Plug 'hdima/python-syntax', { 'for': 'python' }

" C/C++
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'c', 'cpp' ] }
Plug 'rhysd/vim-clang-format', { 'for': [ 'c', 'cpp' ] }
Plug 'petRUShka/vim-opencl', { 'for': [ 'c', 'cpp' ] }

" Smali
Plug 'kelwin/vim-smali', { 'for': 'smali' }

call plug#end()

" }}} Plugins "

" Options {{{ "

" File encodings
set fileencodings=utf-8,cp1251

" Show line numbers
set relativenumber

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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" let base16colorspace=256
colorscheme base16-flat

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

" Use jj to exit from insert mode
inoremap jj <Esc>

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

" Autocmd: vimrc {{{ "

if !exists('*s:reload_vimrc')
  function! s:reload_vimrc()
    source $MYVIMRC
    " Reload lightline
    if exists('*s:lightline_update')
      call s:lightline_update()
    endif
  endfunction
endif

augroup VimrcAutocmdGroup
  autocmd!
  autocmd BufWritePost *vimrc,*init.vim call s:reload_vimrc()
augroup end

" }}} Autocmd: vimrc "

" Autocmd: vim {{{ "

function! s:vim_ft_setup()
  setlocal foldmethod=marker
endfunction

augroup VimAutocmdGroup
  autocmd!
  autocmd FileType vim call s:vim_ft_setup()
augroup end

" }}} Autocmd: vim "

" Plugin: UltiSnips {{{ "

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}} Plugin: UltiSnips "

" Plugin: lightline.vim {{{ "

" Update lightline
function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  catch
  endtry
endfunction

let s:p = {
      \ 'normal': {},
      \ 'insert': {},
      \ 'replace': {},
      \ 'visual': {}
      \ }

vnoremap // y/<C-R>"<CR>

let s:p.normal.middle = [ ['#0000ff', '#ffffff', 7, 18, '' ] ]

let s:p.normal.left = [ ['#0000ff', '#ffffff', 18, 4, 'bold' ] ]
let s:p.normal.right = [ ['#0000ff', '#ffffff', 18, 4, 'bold' ] ]

let s:p.insert.left = [ ['#0000ff', '#ffffff', 18, 2, 'bold' ] ]
let s:p.insert.right = [ ['#0000ff', '#ffffff', 18, 2, 'bold' ] ]

let s:p.insert.left = [ ['#0000ff', '#ffffff', 18, 2, 'bold' ] ]
let s:p.insert.right = [ ['#0000ff', '#ffffff', 18, 2, 'bold' ] ]


let s:p.replace.left = [ ['#0000ff', '#ffffff', 18, 1, 'bold' ] ]
let s:p.replace.right = [ ['#0000ff', '#ffffff', 18, 1, 'bold' ] ]

let s:p.visual.left = [ ['#0000ff', '#ffffff', 18, 3, 'bold' ] ]
let s:p.visual.right = [ ['#0000ff', '#ffffff', 18, 3, 'bold' ] ]

let g:lightline#colorscheme#base16#palette = s:p

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" }}} Plugin: lightline.vim "

" Plugin: CrtlP {{{ "

" CtrlP extensions
let g:ctrlp_extensions = ['tag', 'buffertag']

" Search in buffer tags
let g:ctrlp_map = '<leader>f'
nnoremap <leader>m :CtrlPBuffer<cr>
nnoremap <leader>g :CtrlPTag<cr>
nnoremap <leader>e :CtrlPBufTag<cr>

let g:ctrlp_prompt_mappings = {
      \ 'PrtBS()':              ['<bs>', '<c-]>'],
      \ 'PrtDelete()':          ['<del>'],
      \ 'PrtDeleteWord()':      ['<c-w>'],
      \ 'PrtClear()':           ['<c-u>'],
      \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
      \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
      \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
      \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
      \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
      \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
      \ 'PrtHistory(-1)':       [''],
      \ 'PrtHistory(1)':        [''],
      \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
      \ 'ToggleFocus()':        ['<s-tab>'],
      \ 'ToggleRegex()':        ['<c-r>'],
      \ 'ToggleByFname()':      ['<c-d>'],
      \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
      \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
      \ 'PrtExpandDir()':       ['<tab>'],
      \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
      \ 'PrtInsert()':          ['<c-\>'],
      \ 'PrtCurStart()':        ['<c-a>'],
      \ 'PrtCurEnd()':          ['<c-e>'],
      \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
      \ 'PrtCurRight()':        ['<c-l>', '<right>'],
      \ 'PrtClearCache()':      ['<F5>'],
      \ 'PrtDeleteEnt()':       ['<F7>'],
      \ 'CreateNewFile()':      ['<c-y>'],
      \ 'MarkToOpen()':         ['<c-z>'],
      \ 'OpenMulti()':          ['<c-o>'],
      \ 'PrtExit()':            ['<esc>', '<c-c>'],
      \ }


" }}} Plugin: CrtlP "

" Plugin: YouCompleteMe {{{ "

let g:ycm_key_detailed_diagnostics = ''
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<c-x><c-o>'
" let g:ycm_show_diagnostics_ui = 0

" Autocomplete triggers
let g:ycm_semantic_triggers = {
      \ 'css': [ 're!^\s{2}', 're!:\s+' ],
      \ 'less': [ 're!^\s{2,}', 're!:\s+' ],
      \ 'stylus': [ 're!^\s{2,}', 're!:\s+' ]
      \ }

" }}} YouCompleteMe "

" Plugin: syntastic {{{ "

" Ignore angular attributes in html
let g:syntastic_html_tidy_ignore_errors = [
      \ " proprietary attribute \"ng-",
      \ " proprietary attribute \"ui-",
      \ ]

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠︎'

" JS
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_check_on_wq = 0

" }}} Plugin: syntastic "

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

vnoremap <silent> gr :OverCommandLine<cr>s/\%V
nnoremap <silent> gr :OverCommandLine<cr>s/

" }}} Plugin: vim-over "

" Plugin: vim-easy-align {{{ "

vnoremap ga :EasyAlign<space>

" }}} Plugin: vim-easy-align "

" Plugin: vim-jsx {{{ "

" Enable jsx highlighting for js files
let g:jsx_ext_required = 0

" }}} Plugin: vim-jsx "

" Plugin: NERDTree {{{ "

let g:NERDTreeMapMenu = ','
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeMinimalUI = 1
map <leader><leader> :NERDTreeToggle<cr>

" }}} Plugin: NERDTree "

" Plugin: vim-quick-scope {{{ "

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" }}} Plugin: vim-quick-scope "

" Plugin: vim-easytags {{{ "

" Create tags file in project dir (instead of file dir)
set cpo+=d

" Tags file name '.tags' in project dir
set tags=./.tags

" No global tags file
let g:easytags_file = ''

" Create tags file if not exist
let g:easytags_dynamic_files = 2

" Disable auto update tags file (manual update)
let g:easytags_on_cursorhold = 0
let g:easytags_always_enabled = 0
let g:easytags_events = []

" Mapping for manual tags update
nnoremap <leader>u :UpdateTags<cr>

" }}} Plugin: vim-easytags "

" Plugin: python-syntax {{{ "

let g:python_highlight_all = 1

" }}} Plugin: python-syntax "

" Plugin: vimwiki {{{ "

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.css_name = '~/vimwiki/style.css'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'make': 'make'}
let g:vimwiki_list = [wiki]

" }}} Plugin: vimwiki "

" Plugin: vim-instant-markdown {{{ "

let g:instant_markdown_autostart = 0

" }}} Plugin: vim-instant-markdown "

" Plugin: vim-less {{{ "

augroup LessAutocmd
autocmd!
autocmd FileType less nnoremap <leader>p :w <bar> !lessc % > %:gs?less?css?:p<cr><space>
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
augroup END

" }}} Plugin: vim-less "

" Plugin: vim-stylus {{{ "

augroup StylusAutocmd
autocmd!
autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
augroup END

" }}} Plugin: vim-stylus "

" Plugin: tagbar {{{ "

" Toggle tagbar
nnoremap <leader>t :TagbarToggle<cr>

" Tags for Go
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
\ 'p:package',
\ 'i:imports:1',
\ 'c:constants',
\ 'v:variables',
\ 't:types',
\ 'n:interfaces',
\ 'w:fields',
\ 'e:embedded',
\ 'm:methods',
\ 'r:constructor',
\ 'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
\ 't' : 'ctype',
\ 'n' : 'ntype'
\ },
\ 'scope2kind' : {
\ 'ctype' : 't',
\ 'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }

" }}} Plugin: tagbar "

" Plugin: vim-ag {{{ "

nnoremap <leader>a :Ag<space>

" }}} Plugin: vim-ag "

" Plugin: vim-clang-format {{{ "

let g:clang_format#code_style = 'google'

" Common style options
let g:clang_format#style_options = {
\ }

" Filetype specific options
let g:clang_format#filetype_style_options = {
\ 'cpp' : {
\ },
\ 'c' : {
\ },
\ }

" }}} Plugin: vim-clang-format "

" Plugin: vim-surround {{{ "

" Surround with single/double quiote
nmap g' ysiW'
nmap g" ysiW"

" }}} Plugin: vim-surround "
