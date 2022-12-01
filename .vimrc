"Setting numbers, signcolumn, clipboard, ident maker and turning on mouse and syntax

let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '|'
let g:AutoPairsFlyMode = 1
set number
set signcolumn=yes
set updatetime=100
set clipboard=unnamed
set backspace=indent,eol,start
set listchars=tab:\|\ 
set list
set mouse:a
syntax on

"Calling Plugins

call plug#begin()

call plug#end()

"Setting theme.

set t_Co=256
set t_ut=
let g:codedark_transparent=1
colorscheme codedark

"Seting run program shortcut

autocmd FileType python map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; python3" shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; python3" shellescape(@%, 1)<CR>

autocmd FileType javascript map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J' ; node" shellescape(@%, 1)<CR>
autocmd FileType javascript imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; node" shellescape(@%, 1)<CR>

autocmd FileType rust map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J' ; cargo run"<CR>
autocmd FileType rust imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; cargo run"<CR>

autocmd FileType cpp map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; g++ -o bin" shellescape(@%, 1) ";./bin"<CR>
autocmd FileType cpp imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; g++ -o bin" shellescape(@%, 1)";./bin"<CR>

"shortcuts

nnoremap <C-e> :NERDTree <CR>
nnoremap <C-j> :below term <CR>
imap <C-e> <esc>:NERDTree <CR>
imap <C-j> <esc>:below term <CR>
map <C-i> gg=G
