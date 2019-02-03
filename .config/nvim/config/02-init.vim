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

" tagbar
let g:tagbar_autofocus = 1
