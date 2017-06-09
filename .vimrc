call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'cespare/vim-toml'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/mru.vim'
Plug 'kchmck/vim-coffee-script'
" Plug 'lfilho/cosco.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'keith/swift.vim'
" Plug 'marijnh/tern_for_vim'
Plug 'mklabs/vim-backbone'
Plug 'Lokaltog/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'digitaltoad/vim-pug'
Plug 'jwalton512/vim-blade'
Plug 'pangloss/vim-javascript'
Plug 'dylansm/html5.vim'
Plug 'dylansm/one-dark.vim'
Plug 'dylansm/vim-super-retab'
Plug 'dylansm/nginx.vim'
Plug 'dylansm/vim-stripper'
Plug 'dylansm/vim-twig'
" Plug 'dylansm/vim-es6'
Plug 'dylansm/synbad'
" Plug 'ruanyl/vim-fixmyjs'
Plug 'KabbAmine/vCoolor.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rhysd/vim-clang-format'
Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'kewah/vim-stylefmt'
Plug 'davidoc/taskpaper.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'dylansm/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'itspriddle/vim-marked'
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'
Plug 'dhruvasagar/vim-table-mode'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips' | Plug 'dylansm/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-projectionist', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'guns/vim-slamhound', { 'for': 'clojure' }

" Add plugins to &runtimepath
call plug#end()

syntax on
filetype plugin indent on
colorscheme onedark

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
" hi CursorLine ctermbg=236 ctermfg=246

hi SyntasticWarningSign guifg=Yellow guibg=#303030
hi SyntasticErrorSign guifg=Red guibg=#303030
" hi SyntasticError ctermbg=28
" hi SyntasticWarning ctermbg=28
set fillchars=vert:⎜,diff:—,fold:—

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
" set cursorline
" set cursorcolumn
set laststatus=0
"set backspace=2
set backspace=indent,eol,start
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set ai
set nohlsearch
" set mouse=c
set visualbell
set nu
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
" set synmaxcol=120
"set tags+=gems.tags
"set tags+=js.tags
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

if has('nvim')
  set shada='1000,f1,<500,:100,/100
endif

set rtp+=/usr/local/opt/fzf

let g:clang_library_path='/usr/local/opt/llvm/lib'

au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

"let &colorcolumn=join(range(81,999),",")
" use 'f' to toggle filter
let NERDTreeIgnore = ['\.DS_Store', '\.sass-cache', 'node_modules']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '–'
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeStatusline = 1

" configure syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_mode_map = { 'mode': 'active',
  "\ 'active_filetypes': [],
  "\ 'passive_filetypes': ['coffee', 'html'] }

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless'}
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "➣"
let g:syntastic_warning_symbol = "➢"
let g:syntastic_style_error_symbol = "➣"
let g:syntastic_style_warning_symbol = "➢"
let g:jsx_ext_required = 1
"let g:syntastic_python_python_exec = '~/.pyenv/shims/python'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_json_checkers = ['jsonlint']
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint-scss']
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors = [
    \  '<base> escaping malformed URI reference',
    \  '<script> escaping malformed URI reference',
    \  '<video> proprietary attribute',
    \ ]
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" automatically show info for identifier under cursor
" let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" let g:syntastic_html_tidy_ignore_errors = [
    " \  'plain text isn''t allowed in <head> elements',
    " \  '<base> escaping malformed URI reference',
    " \  'discarding unexpected <body>',
    " \  '<script> escaping malformed URI reference',
    " \  '</head> isn''t allowed in <body> elements'
    " \ ]

imap ;s <plug>SyntasticCheck

function! <SID>LocationPrevious()
  if !empty(getloclist(0))
    try
      lprev
    catch /^Vim\%((\a\+)\)\=:E553/
      llast
    endtry
  endif
endfunction

function! <SID>LocationNext()
  if !empty(getloclist(0))
    try
      lnext
    catch /^Vim\%((\a\+)\)\=:E553/
      lfirst
    endtry
  endif
endfunction

nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> <C-K> <Plug>LocationPrevious
nmap <silent> <C-J> <Plug>LocationNext
nmap <silent> <Leader>s :!standard-format -w %<CR>

" Clang Format
au FileType c,cpp,objc nmap <silent> <Leader>f :ClangFormat<CR>
nmap <Leader>m :!make<CR>

" Style Format
au FileType css nmap <silent> <Leader>f :Stylefmt<CR>
au FileType css vnoremap <silent> <Leader>f :StylefmtVisual<CR>

" let g:ycm_filetype_specific_completion_to_disable = {
      " \ 'php': 1
      " \}

" Utility function to echo syntax under cursor
nmap ;y :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"
nmap ;j <Plug>UltiSnipsEdit

let g:deoplete#enable_at_startup = 1

" Toggle paste mode
nmap <C-P> :set invpaste paste?<CR>

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" set j/k keys to treat wrapped lines as multiple rows
nnoremap j gj
nnoremap k gk

" place cursor in middle after search and end-of-paragraph
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" correct cursor placement after linebreak
"imap <C-c> <CR><Esc>O
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

let g:mustache_abbreviations = 1

:map <F7> :setlocal spell! spelllang=en_us<CR>

" toggle comments
map // <plug>NERDCommenterToggle
let NERDSpaceDelims=1
" custom comments
let g:NERDCustomDelimiters = {
    \ 'javascript.jsx': { 'left': '{/*', 'right': '*/}'}
\ }

"map ;b :!open -a Safari %<CR><CR>
"map <C-b> :!open -a Safari %<CR>

" remap jj to escape
imap jj <ESC>

" yank to end of line
nnoremap Y y$

" Clear screen clears search highlighting.
nnoremap <C-L> :nohl<CR><C-L>

" Dash for current word
function! LookupCurrentWordInDash()
  let cword = expand("<cword>")
  :silent exec "!open 'dash://'" . cword
  :redraw!
endfunction

" nmap <silent><Leader>[ :call LookupCurrentWordInDash()<CR>
nmap <silent>;/ :call LookupCurrentWordInDash()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ;a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ;a <Plug>(EasyAlign)

" remap autocomplete navigation to j/k keys
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>

" set filetype to Ruby with :FR
command! FR set filetype=ruby

"map ;k :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Shortcut to rapidly toggle `set list`
nmap <Leader>ll :set list!<CR>

nnoremap <Leader>sh :Slamhound<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
set list listchars=tab:▸\ ,trail:.

" function! ToggleCoffeeCompilation()
  " if exists("g:coffee")
    " echo "Coffee compilation disabled"
    " unlet g:coffee
  " else
    " echo "Coffee compilation enabled"
    " let g:coffee=1
  " endif
" endfunction

" nmap <silent>;c :call ToggleCoffeeCompilation()<CR>

" most recently used
" nmap <silent>;r :MRU<CR>
nmap <silent>;r :FZFMru<CR>
" inoremap <expr> ;d fzf#complete('cat /usr/share/dict/web2')

let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Add_Menu = 0

" tagbar
let g:tagbar_autofocus = 1
" nmap <silent>;; :TagbarOpenAutoClose<CR>
nmap <silent>;; :TagbarToggle<CR>
" nmap <silent><Leader>s :call Tab2Space()<CR>
" nmap <silent><Leader>t :call Space2Tab()<CR>
" inoremap <C-]> <C-x><C-o>

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

nmap <silent>;w :set wrap!<CR>
nmap <silent>;m :MarkedOpen!<CR>

" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_null       = "ø"
" let g:javascript_conceal_this       = "@"
" let g:javascript_conceal_return     = "⇚"
" let g:javascript_conceal_undefined  = "¿"
" let g:javascript_conceal_NaN        = "ℕ"
" let g:javascript_conceal_prototype  = "¶"
" let g:javascript_conceal_static     = "•"
" let g:javascript_conceal_super      = "Ω"

if has("autocmd")
  autocmd BufWritePost,FileWritePost *.coffee if exists("g:coffee") | :silent !coffee -c <afile>
  au BufRead,BufNewFile *.hamlc set ft=haml
  au BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
  au BufEnter *.c compiler gcc
  au BufRead,BufNewFile *.h,*.hpp,*.c,*.cpp,*.swift set ts=4 sw=4 sts=4
  " au BufRead,BufNewFile *.cpp set ts=4 sw=4 sts=4
  " au BufRead,BufNewFile *.h set ts=4 sw=4 sts=4
  " au BufRead,BufNewFile *.hpp set ts=4 sw=4 sts=4
  au BufRead,BufNewFile *.conf set ft=apache
  au BufRead,BufNewFile *.go set noet ts=4 sw=4
  au BufRead,BufNewFile *.markdown set noet sts=4 sw=4
  au BufRead,BufNewFile *.java set ts=4 sw=4 sts=4
  au BufRead,BufNewFile *.scss set sw=2 sts=2
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o

  "remember last position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <C-F> :Ag<space>
map ;f :FZF<CR>

command! -nargs=1 Locate call fzf#run(
  \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" toggle NERDTree
map \\ :NERDTreeToggle<CR>
" map ;; :Lexplore<CR>

" change window
map <Leader>ww :winc w<CR>

" quickfix open
map <Leader>aa :cope<CR>
" close
map <Leader>vv :ccl<CR>

" Emmet / Zen Coding
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,javascript,xml EmmetInstall
" let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_leader_key = '<c-m>'
let g:user_emmet_settings = {
  \  'indentation' : '  '
  \}

" Vim Fireplace (Clojure only)
" autocmd this so it's only on in clojure context
" nmap <Leader>q cqq
" nmap <Leader>c cqc
" nmap ;c :Connect nrepl://127.0.0.1:50133 .<CR>

" alt-shift + h,j,k,l keys
map <silent>Ò :vertical res -10<CR>
map <silent>Ô :res -10<CR>
map <silent> :res +10<CR>
map <silent>Ó :vertical res +10<CR>
map <silent>¬ <C-w><
map <silent>∆ <C-W>-
map <silent>˚ <C-W>+
map <silent>˙ <C-w>>

"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" let g:rspec_command = '!rspec spec --drb --drb-port 8988'
" vim-rspec mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

function! SourceConfig()
  if filereadable(".config.vim")
    echo "Loading config.vim..."
  endif
endfunction

" nmap <Leader>c :source %:p:h/.config.vim<CR>
nmap <Leader>x :!chmod a+x %<CR>

" python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1

" toggle colored right border after 80 chars
"let s:color_column_old = 81

"function! s:ToggleColorColumn()
    "if s:color_column_old == 0
        "let s:color_column_old = &colorcolumn
        "windo let &colorcolumn = 0
    "else
        "windo let &colorcolumn=s:color_column_old
        "let s:color_column_old = 0
    "endif
"endfunction

"nnoremap <silent>;l :call <SID>ToggleColorColumn()<CR>


" let g:CoffeeAutoTagDisabled=0         " Disables autotaging on save (Default: 0 [false])
" let g:CoffeeAutoTagIncludeVars=0  " Includes variables (Default: 0 [false])

" Incr function will add numbers in search and replace
" Usage: %s/change@me/\="change@me" . Incr()/
" \= is the special magic combo for interpolation
let g:incr = 1
function! Incr()
  let g:incr = g:incr + 1
  return g:incr
endfunction

" let s:hidden_all = 0
" function! ToggleHiddenAll()
    " if s:hidden_all  == 0
        " let s:hidden_all = 1
        " set noshowmode
        " set noruler
        " set laststatus=0
        " set noshowcmd
    " else
        " let s:hidden_all = 0
        " set showmode
        " set ruler
        " set laststatus=2
        " set showcmd
    " endif
" endfunction

" nnoremap <silent>;h :call ToggleHiddenAll()<CR>

