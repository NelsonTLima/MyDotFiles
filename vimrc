"GENERAL SETTINGS

set number
set signcolumn=yes
set updatetime=200
set clipboard=unnamed "Setting clipboard to allow pasting somenthing that was copied outside VIM.
set mouse:a
set t_Co=256
set t_ut=
let g:codedark_transparent=1
colorscheme slate
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd ColorScheme * hi SignColumn guibg=NONE ctermbg=NONE
autocmd VimEnter * hi SignColumn guibg=NONE ctermbg=NONE
syntax on
set list lcs=tab:\|\ ,trail:~ "Trail char and indentlines for the languages that the plugin doesnt work.
set tabstop=4
set softtabstop=2
set shiftwidth=2
autocmd FileType javascript set shiftwidth=2 softtabstop=2
autocmd FileType typescript set shiftwidth=2 softtabstop=2
autocmd FileType javascriptreact set shiftwidth=2 softtabstop=2
autocmd FileType typescriptreact set shiftwidth=2 softtabstop=2
autocmd FileType text let g:indentLine_enabled = 0
autocmd FileType text set nolist
set autoindent
set smartindent
set shiftround
set expandtab
set backspace=indent,eol,start

"MY CUSTOM VIM FUNCTIONS

function! SetServerShortcuts()
    if &filetype == "html"
        set updatetime=2000
        map <F4> :w<CR>:below term<CR>live-server<CR>
        imap <F4> <esc>:w<CR>:below term<CR>live-server<CR>
    elseif &filetype == or("typescriptreact","javascriptreact")
        set updatetime=2000
        map <F4> :w<CR>:below term<CR>npm run dev<CR>
        imap <F4> <esc>:w<CR>:below term<CR>npm run dev<CR>
    endif
endfunction

function! CompileAndRunCode()
    let commands = {
    \"python": 'python3 %',
    \"javascript": 'node %',
    \"rust": 'cargo run',
    \"bash": './%',
    \"c": 'gcc -o %:r %;./%:r',
    \"cpp": 'g++ -o %:r %;./%:r'}

    if has_key(commands, &filetype)
        exec $"!clear && printf '\e[3J' ; {commands[&filetype]}"
    else
        echo "Filetype not Supported"
    endif
endfunction

function! TestCode()
    let commands = {
    \"python": 'pytest -v test.py'}

    if has_key(commands, &filetype)
        exec $"!clear && printf '\e[3J' ; {commands[&filetype]}"
    else
        echo "Filetype not Supported"
    endif
endfunction

"MY CUSTOM SHORTCUTS

call SetServerShortcuts()
map <F1> <esc>:below term<CR>
map <F2> <esc><C-w>h
map <F3> <esc>:w<CR>
map <F5> <esc>:call CompileAndRunCode()<CR>
autocmd filetype vim map <buffer> <F5> <esc>:source %<CR>
map <F6> <esc>:call TestCode()<CR>
map <F7> <esc>:tabp<CR>
map <F8> <esc><C-w>l
map <F9> <esc>:tabn<CR>
map <F10> <esc>:NERDTreeMirror<CR>:NERDTreeFocus<CR>
map <F12> <esc>:q<CR>

imap <F1> <esc>:below term<CR>
imap <F2> <esc><C-w>h
imap <F3> <esc>:w<CR>
imap <F5> <esc>:call CompileAndRunCode()<CR>
autocmd filetype vim imap <buffer> <F5> <esc>:source %<CR>
imap <F6> <esc>:call TestCode()<CR>
imap <F7> <esc>:tabp<CR>
imap <F8> <esc><C-w>l
imap <F9> <esc>:tabn<CR>
imap <F10> <esc>:NERDTreeMirror<CR>:NERDTreeFocus<CR>
imap <F12> <esc>:q<CR>

"LOAD NEOBUNDLE PLUGINS.

if 0 | endif

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'PhilRunninger/nerdtree-visual-selection'
NeoBundle 'ryanoasis/vim-devicons'

call neobundle#end()
filetype plugin indent on

" If there aire uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"Otherwise use ':NeoBundleInstall'
NeoBundleCheck

"PLUGIN SETTINGS

"DevIcons.
set encoding=utf-8
let g:airline_powerline_fonts = 1

"NERDTree.
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"INDENTLINE
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '|'

"AUTOPAIRS
let g:AutoPairsFlyMode = 1

"AUTOSAVE
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "CursorHoldI"]
