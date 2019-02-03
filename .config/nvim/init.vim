for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor

" if using brew installed llvm uncomment
let g:clang_library_path='/usr/local/opt/llvm/lib/'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/opt/llvm/lib/libclang.dylib'

au VimEnter * RainbowParenthesesToggle

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

let g:deoplete#enable_at_startup = 1
let g:mustache_abbreviations = 1

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
