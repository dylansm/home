" set runtimepath+=/Users/Shared/Development/Projects/Vim/Synbad
" set runtimepath+=/Users/Shared/Development/Projects/Vim/HuePickens
" set runtimepath+=/Users/Shared/Development/Projects/Vim/ES6y
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/mru.vim'
Plug 'kchmck/vim-coffee-script'
" Plug 'lfilho/cosco.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'helino/vim-json'
" Plug 'marijnh/tern_for_vim'
Plug 'mklabs/vim-backbone'
Plug 'Lokaltog/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'digitaltoad/vim-pug'
Plug 'jwalton512/vim-blade'
Plug 'pangloss/vim-javascript'
Plug 'dylansm/html5.vim'
Plug 'dylansm/vim-super-retab'
Plug 'dylansm/nginx.vim'
Plug 'dylansm/vim-stripper'
Plug 'dylansm/vim-twig'
" Plug 'dylansm/vim-es6'
Plug 'dylansm/synbad'
" Plug 'ruanyl/vim-fixmyjs'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kewah/vim-stylefmt'
Plug 'davidoc/taskpaper.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'dylansm/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
" Plug 'dylansm/nerdcommenter'
Plug 'itspriddle/vim-marked'
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'

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

" Themes
Plug 'dylansm/one-dark.vim'

" Add plugins to &runtimepath
call plug#end()

syntax on
filetype plugin indent on
highlight Comment cterm=italic

"let &colorcolumn=join(range(81,999),",")
" use 'f' to toggle filter
let NERDTreeIgnore = ['\.DS_Store', '\.sass-cache', 'node_modules']
"highlight NERDTreeOpenable ctermfg=Blue
"highlight NERDTreeClosable ctermfg=Blue
highlight Title guifg=#20b950
highlight NERDTreeOpenable guifg=#20b950
highlight NERDTreeClosable guifg=#20b950

let mapleader           = ","
let html_no_rendering   = 1
let g:netrw_liststyle   = 1
let g:netrw_winsize     = 28
let g:netrw_keepdir     = 0
let g:netrw_list_hide   = '.*\.swp\*,.*\.swp$,.*\.swp\s,.*/$,.*/\s'
let g:netrw_banner      = 0
let g:netrw_dirhistmax  = 10
let g:netrw_dirhist_cnt = 0
"let g:netrw_altv        = 1
set viminfo=""
set noswapfile
set splitbelow
set splitright
set showmatch
set cursorline
set cursorcolumn
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
set mouse=a
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
colorscheme onedark
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

au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

" configure syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_mode_map = { 'mode': 'active',
  "\ 'active_filetypes': [],
  "\ 'passive_filetypes': ['coffee', 'html'] }

highlight SyntasticWarningSign guifg=Yellow guibg=#303030
highlight SyntasticErrorSign guifg=Red guibg=#303030

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
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors = [
    \  '<base> escaping malformed URI reference',
    \  '<script> escaping malformed URI reference',
    \ ]

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
nmap <silent> <leader>s :!standard-format -w %<CR>

nnoremap <silent> <leader>f :Stylefmt<CR>
vnoremap <silent> <leader>f :StylefmtVisual<CR>


" let g:ycm_filetype_specific_completion_to_disable = {
      " \ 'php': 1
      " \}

" Utility function to echo syntax under cursor
nmap ;y :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


let g:UltiSnipsUsePythonVersion = 2
" let g:UltiSnipsSnippetDirectories=['vim-snippets', 'my-vim-snippets']
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"
nmap ;j <Plug>UltiSnipsEdit

" NeoSnippet
"imap <C-j>     <Plug>(neosnippet_expand_or_jump)
"smap <C-j>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-j>     <Plug>(neosnippet_expand_target)
"let g:neosnippet#snippets_directory='~/.vim/plugged/my-vim-snippets/snippets'

let g:deoplete#enable_at_startup = 1

" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

" let g:ycm_filetype_blacklist = {
      " \ 'gitcommit' : 1,
      " \ 'tagbar' : 1,
      " \ 'qf' : 1,
      " \ 'notes' : 1,
      " \ 'taskpaper' : 1,
      " \ 'markdown' : 1,
      " \ 'text' : 1,
      " \ 'infolog' : 1,
      " \ 'mail' : 1
      " \}

" let g:ycm_semantic_triggers =  {
  " \   'coffee' : [' -> ', ' => ', '.'],
  " \ }

" Toggle paste mode
nmap <C-P> :set invpaste paste?<CR>

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <C-]> <C-x><C-o>

" set j/k keys to treat wrapped lines as multiple rows
nnoremap j gj
nnoremap k gk

" place cursor in middle after search and end-of-paragraph
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

"nmap <buffer> ;e <Plug>(xmpfilter-run)
"xmap <buffer> ;e <Plug>(xmpfilter-run)
"imap <buffer> ;e <Plug>(xmpfilter-run)
"nmap <buffer> ;d <Plug>(xmpfilter-mark)
"xmap <buffer> ;d <Plug>(xmpfilter-mark)
"imap <buffer> ;d <Plug>(xmpfilter-mark)

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
    \ 'javascript.jsx': { 'left': '// {/*', 'right': '*/}'}
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
inoremap <expr> ;d fzf#complete('cat /usr/share/dict/web2')

let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Add_Menu = 0

" tagbar
" let g:tagbar_autofocus = 1
" nmap <silent>;; :TagbarOpenAutoClose<CR>
"nmap <silent>;; :TagbarToggle<CR>
" nmap <silent><leader>s :call Tab2Space()<CR>
" nmap <silent><leader>t :call Space2Tab()<CR>
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
  " if global custom variable "coffee" is set (using let)
  autocmd BufWritePost,FileWritePost *.coffee if exists("g:coffee") | :silent !coffee -c <afile>
  autocmd BufWritePost *.swift :make
  " format hamlc files as haml
  au BufRead,BufNewFile *.hamlc set ft=haml
  au BufRead,BufNewFile *.conf set ft=apache
  "au BufRead,BufNewFile *.go set st=8 sw=8 sts=8
  au BufRead,BufNewFile *.go set noet ts=4 sw=4
  au BufRead,BufNewFile *.markdown set noet sts=4 sw=4
  "au BufRead,BufNewFile *.java set st=4 sw=4 sts=4
  au BufRead,BufNewFile *.java set ts=4 sw=4 sts=4
  au BufRead,BufNewFile *.scss set sw=2 sts=2
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o

  " autocmd FileType javascript,css,json nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
  " autocmd FileType javascript,css,json inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>

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
"map ;; :Lexplore<CR>

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
nmap <leader>q cqq
nmap <leader>c cqc
nmap ;c :Connect nrepl://127.0.0.1:50133 .<CR>

" alt-shift + h,j,k,l keys
map <silent>Ó :vertical res -10<CR>
map <silent> :res -10<CR>
map <silent>Ô :res +10<CR>
map <silent>Ò :vertical res +10<CR>
map <silent> ˙ <C-w><
map <silent> ∆ <C-W>-
map <silent> ˚ <C-W>+
map <silent> ¬ <C-w>>

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

" if executable('coffeetags')
  " let g:tagbar_type_coffee = {
        " \ 'ctagsbin' : 'coffeetags',
        " \ 'ctagsargs' : '',
        " \ 'kinds' : [
        " \ 'f:functions',
        " \ 'o:object',
        " \ ],
        " \ 'sro' : ".",
        " \ 'kind2scope' : {
        " \ 'f' : 'object',
        " \ 'o' : 'object',
        " \ }
        " \ }
" endif

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
