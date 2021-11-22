set exrc
set secure
syntax on
filetype plugin indent on
colorscheme onedark

" remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

hi NERDTreeOpenable ctermfg=246
hi NERDTreeClosable ctermfg=250
hi Title guifg=#20b950
hi NERDTreeOpenable guifg=#20b950
hi NERDTreeClosable guifg=#20b950
hi LineNr ctermfg=242
hi Normal ctermfg=251
hi NonText ctermfg=236
hi VertSplit ctermbg=247 ctermfg=236
hi StatusLineNC ctermbg=247 ctermfg=236
highlight Comment cterm=italic

hi SyntasticWarningSign guifg=Yellow guibg=#303030
hi SyntasticErrorSign guifg=Red guibg=#303030
set fillchars=vert:\│,diff:—,fold:—

let mapleader           = ","
let html_no_rendering   = 1
let g:netrw_liststyle   = 1
let g:netrw_winsize     = 28
let g:netrw_keepdir     = 0
let g:netrw_list_hide   = '.*\.swp\*,.*\.swp$,.*\.swp\s,.*/$,.*/\s'
let g:netrw_banner      = 0
let g:netrw_dirhistmax  = 10
let g:netrw_dirhist_cnt = 0
set hidden
set viminfo=""
set noswapfile
set splitbelow
set splitright
set showmatch
set laststatus=0
set backspace=indent,eol,start
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set ai
set nohlsearch
set visualbell
set ruler
set nowrap
set linebreak
set showcmd
set smartcase
set incsearch
set scrolloff=2
set nolist
set wildmenu
set wildmode=longest,list
set shortmess+=I
set clipboard=unnamed
set nofoldenable
set showmode
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

if has('nvim')
  set shada='1000,f1,<500,:100,/100
endif

" turn off cursorline underline
hi CursorLine term=bold cterm=bold

set rtp+=/usr/local/opt/fzf

let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Add_Menu = 0

" let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:python3_host_prog = '/Users/dylan/.pyenv/versions/3.9.5/bin/python'

" tagbar
let g:tagbar_autofocus = 1

let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" if using brew installed llvm uncomment
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/llvm/bin/clang')
" let g:clang_library_path='/usr/local/opt/llvm/lib/'
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/opt/llvm/lib/libclang.dylib'
" disable autocomplete by default
" let b:deoplete_disable_auto_complete=1
" let g:deoplete_disable_auto_complete=1
" let g:deoplete#sources = {}
" Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
            " \ 'disabled_syntaxes', ['Comment', 'String'])

" use 'f' to toggle filter
let NERDTreeIgnore = ['\.DS_Store', '\.sass-cache', 'node_modules']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '–'
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeStatusline = 1

if exists("g:vdebug_options")
  let g:vdebug_options['port'] = 9001
endif

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"

let NERDSpaceDelims=1
" custom comments
let g:NERDCustomDelimiters = {
    \ 'javascript.jsx': { 'left': '{/*', 'right': '*/}'}
\ }

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
set list listchars=tab:▸\ ,trail:.

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

" Emmet / Zen Coding
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,javascript,xml EmmetInstall
" let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_leader_key = '<c-m>'
let g:user_emmet_settings = {
  \  'indentation' : '  '
  \}

let ropevim_enable_shortcuts = 1

" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_c_compiler = 'clang'
" let g:syntastic_c_checkers=['/usr/local/opt/llvm/bin/clang-check']

let g:rustfmt_autosave = 1
let g:rustfmt_command = "/Users/dylan/.cargo/bin/rustfmt"
let g:racer_cmd = "/Users/dylan/.cargo/bin/racer"
" let g:racer_experimental_completer = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'rust': ['rustfmt'],
\}

let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
