"PLUGIN INSTALLER

"NEOBUNDLE (:NeoBundleInstall).

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'PhilRunninger/nerdtree-visual-selection'
NeoBundle 'ryanoasis/vim-devicons'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"________________________________________________________________

"Setting DevIcons.
set encoding=utf-8
let g:airline_powerline_fonts = 1

"Setting NERDTree.
nnoremap <C-e> <esc>:NERDTreeMirror<CR>:NERDTreeFocus<CR>
imap <C-e> <esc>:NERDTreeMirror<CR>:NERDTreeFocus<CR>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Setting indentLine plugin
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '|'

"Setting AutoPairs plugin
let g:AutoPairsFlyMode = 1

"Setting auto save.
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "CursorHoldI"]

"Setting line numbers.
set number

"Setting column (where git symbols are shown).
set signcolumn=yes

"Setting a trail char and indentlines for programming languages that the plugin doesnt work.
set list lcs=tab:\|\ ,trail:~


"Setting clipboard to allow pasting somenthing that was copied outside VIM.
set clipboard=unnamed

"Setting terminal colors.
set t_Co=256
set t_ut=

"Setting theme.
let g:codedark_transparent=1
colorscheme codedark

"Tab settings.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set shiftround
set expandtab
set ai

"Other settings.
set updatetime=200
set backspace=indent,eol,start
set mouse:a
syntax on

"Global shortcuts.

nnoremap <C-j> :below term <CR>
imap <C-j> <esc>:below term <CR>
nnoremap <C-j> :below term <CR>
imap <C-j> <esc>:below term <CR>
nnoremap <F9> <esc>:tabn<CR>
imap <F9> <esc>:tabn<CR>
nnoremap <F8> <esc>:tabp<CR>
imap <F8> <esc>:tabp<CR>

"FileType particularities.

"________________PYTHON________________________________

"Run shortcuts.
autocmd FileType python map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; python3 %"<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; python3 %"<CR>

"Pytest shortcuts.
autocmd FileType python map <buffer> <F6> :w<CR>:exec "!clear && printf '\e[3J';pytest -v test.py"<CR>
autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:exec "!clear && printf '\e[3J' ;pytest -v test.py"<CR>

"Pydoc shortcut.
autocmd FileType python map <buffer> K <esc>viwy<esc>:w<CR>:exec "!clear && printf '\e[3J'; pydoc3 %:r.<D-v>"<CR>

"________________JAVASCRIPT______________________________

"Tabulation.
autocmd FileType javascript set shiftwidth=2 softtabstop=2

"Run with node js.
autocmd FileType javascript map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J' ; node %"<CR>
autocmd FileType javascript imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; node %"<CR>


"________________BASH___________________________________

"Run executable.
autocmd FileType sh map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J' ; ./%"<CR>
autocmd FileType sh imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; ./%"<CR>

"________________HTML__________________________________

"Run live-server.
autocmd FileType html map <buffer> <F5> :w<CR>:below term<CR>live-server<CR>
autocmd FileType html imap <buffer> <F5><esc>:w<CR>:below term<CR>live-server<CR>

"________________RUST__________________________________

"Cargo run.
autocmd FileType rust map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J' ; cargo run"<CR>
autocmd FileType rust imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; cargo run"<CR>

"________________C_and_C++_____________________________

"Compile and run shortcut.
autocmd FileType cpp map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; g++ -o bin %;./bin"<CR>
autocmd FileType cpp imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; g++ -o bin %;./bin"<CR>
autocmd FileType c map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; gcc -o bin %;./bin"<CR>
autocmd FileType c imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; gcc -o bin %;./bin"<CR>
