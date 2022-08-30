"Setting numbers, signcolumn, clipboard, ident maker and turning on mouse and syntax

set number
set signcolumn=yes
set clipboard=unnamed
set listchars=tab:\|\ 
set list
set mouse:a
syntax on

"Setting theme.

colorscheme codedark
let g:codedark_transparent=1

"Seting run program shortcut

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType javascript map <buffer> <F5> :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType javascript imap <buffer> <F5> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>

"uncomment if you want the following:

"autocmd VimEnter * NERDTree | wincmd p
