"--- source --------------------------------------------------------------------

runtime snippets.vim

"--- plugins -------------------------------------------------------------------

call plug#begin('$XDG_DATA_HOME/nvim/plugins')

Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'KKPMW/vim-sendtowindow'

call plug#end()

let g:lion_squeeze_spaces = 1

"--- settings ------------------------------------------------------------------

colorscheme colors

set undofile                 " turn on persistent undo

set statusline=%=%f          " statusline only shows file at right corner
set fillchars=stl:-,stlnc:-  " statusline is always filled with dashes
set foldcolumn=1             " some margin between edge and text

set splitright splitbelow equalalways eadirection=hor  " window settings
set shiftwidth=2 tabstop=2 expandtab                   " tab settings

set list                  " display whitespace characters
set path=.,**             " include all subdirectories in find path
set nojoinspaces          " no double spaces when joining sentences
set virtualedit=block     " allow going to empty space in visual column mode

set completeopt+=menuone  " show completion popmenu even for single matches
set nowrapscan            " don't continue search at the top
set cpoptions-=_          " make cw consistent
set inccommand=nosplit    " show visual feedback for substitution commands

"--- maps ----------------------------------------------------------------------

noremap Y y$
noremap U <c-r>

nnoremap / :set nohlsearch <cr>/
nnoremap ? :set nohlsearch <cr>?

nnoremap <silent> <c-_> :set hlsearch!<cr>
nnoremap <silent> <c-s> :set spell!<cr>
nnoremap <silent> <expr> <c-\> &colorcolumn == 0 ? ":set colorcolumn=81<cr>" : ":set colorcolumn=0<cr>"
nnoremap <silent> <c-j> 5<c-e>
nnoremap <silent> <c-k> 5<c-y>

cnoremap <c-a> <home>

tnoremap <esc> <c-\><c-n>
tnoremap <c-w> <c-\><c-n><c-w>

"--- commands ------------------------------------------------------------------

command! -nargs=0 Highlight for id in synstack(line("."), col(".")) | echo synIDattr(id, "name") | endfor
command! -nargs=0 Trimws keeppatterns %s/\s\+$//e
command! -nargs=0 Rterm belowright 20split | terminal R --quiet --no-save --no-restore

