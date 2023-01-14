"Settings

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

"Other settings.
set updatetime=1000
set backspace=indent,eol,start
set mouse:a
syntax on

"Global shortcuts.

nnoremap <C-e> :NERDTree <CR>
nnoremap <C-j> :below term <CR>
imap <C-e> <esc>:NERDTree <CR>
imap <C-j> <esc>:below term <CR>

"FileType particularities.


"________________PYTHON________________________________

"Tabulation.
autocmd FileType python set shiftwidth=4 softtabstop=4

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

"________________C____________________________________

"Compile and run shortcut.
autocmd FileType cpp map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; g++ -o bin %;./bin"<CR>
autocmd FileType cpp imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; g++ -o bin %;./bin"<CR>
autocmd FileType c map <buffer> <F5> :w<CR>:exec "!clear && printf '\e[3J'; gcc -o bin %;./bin"<CR>
autocmd FileType c imap <buffer> <F5> <esc>:w<CR>:exec "!clear && printf '\e[3J' ; gcc -o bin %;./bin"<CR>
