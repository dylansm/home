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
au BufNewFile,BufRead * setlocal formatoptions-=o

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesToggle

let g:vim_jsx_pretty_colorful_config = 1
