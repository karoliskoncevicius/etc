"--- source --------------------------------------------------------------------

filetype plugin indent on

runtime snippets.vim

"--- plugins -------------------------------------------------------------------

nmap s  <Plug>SendDown
nmap ss <Plug>SendDown_
nmap S  <Plug>SendDowng_
vmap s  <Plug>SendDownV
vmap S  <Plug>SendDownV

"--- settings ------------------------------------------------------------------

syntax enable
colorscheme colors

set statusline=%=%f foldcolumn=1 fillchars=stl:-,stlnc:-  " look and feel
set splitright splitbelow equalalways eadirection=hor     " window settings
set shiftwidth=2 tabstop=2 expandtab                      " tab settings
set nohlsearch nowrapscan                                 " search settings

set undofile                 " turn on persistent undo
set path=.,**                " include all subdirectories in find path

set list                     " display whitespace characters
set nojoinspaces             " no double spaces when joining sentences
set virtualedit=block        " allow going to empty space in visual column mode

set cpoptions-=_             " make cw consistent
set completeopt+=menuone     " show completion popmenu even for single matches

"--- maps ----------------------------------------------------------------------

noremap Y y$
noremap U <c-r>

noremap <c-j> <c-d>
noremap <c-k> <c-u>

nnoremap <silent> <c-_> :set hlsearch!<cr>
nnoremap <silent> <c-s> :set spell!<cr>
nnoremap <silent> <expr> <c-\> &colorcolumn == 0 ? ":set colorcolumn=81<cr>" : ":set colorcolumn=0<cr>"

cnoremap <c-a> <home>
tnoremap <esc> <c-\><c-n>

"--- commands ------------------------------------------------------------------

command! -nargs=0 Highlight for id in synstack(line("."), col(".")) | echo synIDattr(id, "name") | endfor
command! -nargs=0 Rterm belowright 15split | terminal R --quiet --no-save --no-restore
command! -nargs=0 Trimws keeppatterns %s/\s\+$//e
command! -nargs=0 Toascii %!iconv -f utf-8 -t ascii//translit

