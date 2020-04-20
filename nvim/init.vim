" INTRO ========================================================================

filetype indent plugin on

" SOURCE =======================================================================

runtime snippets.vim

" PLUGINS ======================================================================

call plug#begin('$XDG_DATA_HOME/nvim/plugins')

" integration
Plug 'tpope/vim-fugitive'

" operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'tommcdo/vim-lion'
Plug 'KKPMW/vim-sendtowindow'

" text objects
Plug 'kana/vim-textobj-user'

call plug#end()

" PLUGIN SETTINGS ==============================================================

" commentary
nmap gc <nop>
xmap #  <Plug>Commentary
nmap #  <Plug>Commentary
omap #  <Plug>Commentary
nmap ## <Plug>CommentaryLine

" sendtowindow
let g:sendtowindow_use_defaults = 0
nmap <silent> <c-l> <Plug>SendRight
xmap <silent> <c-l> <Plug>SendRightV
nmap <silent> <c-h> <Plug>SendLeft
xmap <silent> <c-h> <Plug>SendLeftV
nmap <silent> <c-k> <Plug>SendUp
xmap <silent> <c-k> <Plug>SendUpV
nmap <silent> <c-j> <Plug>SendDown
xmap <silent> <c-j> <Plug>SendDownV

" lion
let g:lion_create_maps = 0
let g:lion_squeeze_spaces = 1
nmap <silent> ga <Plug>LionRight
vmap <silent> ga <Plug>VLionRight
nmap <silent> gA <Plug>LionLeft
vmap <silent> gA <Plug>VLionLeft

" sandwich
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
nmap <unique> s <Plug>(operator-sandwich-add)
xmap <unique> s <Plug>(operator-sandwich-add)
omap <unique> s <Plug>(operator-sandwich-g@)
nmap <unique><silent> ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <unique><silent> cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap ss  0s$
nmap S   s$
xmap S   s
omap <unique> is <Plug>(textobj-sandwich-query-i)
xmap <unique> is <Plug>(textobj-sandwich-query-i)
omap <unique> as <Plug>(textobj-sandwich-query-a)
xmap <unique> as <Plug>(textobj-sandwich-query-a)

" replace operator
map gr <Plug>(operator-replace)

" SETTINGS =====================================================================

" BEHAVIOUR --------------------------------------------------------------------

set nomodeline        " disable modelines
set comments=         " Let the filetype take care of comments
set nrformats=        " treat all numbers as decimal
set hidden            " don't issue warnings when using :bnext on edited buffer
set path=.,**         " path for 'find' includes subdirectories
set nojoinspaces      " don't add spaces when joining lines
set virtualedit=block " allow to move to empty space when in visual block mode

set completeopt+=menuone

set splitright      " open new horizontal splits on the rights
set splitbelow      " open new vertical splits on the bottom
set equalalways     " resize other windows after closing/opeing a window
set eadirection=hor " only apply 'equalalways' horizontally

set shiftwidth=2  " number of spaces per indent level
set tabstop=2     " number of spaces per tab
set expandtab     " spaces instead of tabs
set backspace=2   " sane backspace options

set incsearch     " incremental search
set nohlsearch    " don't highlight after searching
set nowrapscan    " don't continue search at the top

set breakindent       " break long lines
set showbreak=\\\\\   " broken lines are indented

set cpoptions-=_      " make cw consistent
set inccommand=nosplit
set diffopt=vertical,filler,internal,algorithm:histogram,indent-heuristic

set undofile                             " enable persistent undo
set backup                               " enable backup
set backupdir=$XDG_DATA_HOME/nvim/backup " set and create backupdir
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

let $BASH_ENV="$XDG_CONFIG_HOME/bash/aliases" " location of bash aliases
let g:netrw_home=$XDG_DATA_HOME.'/nvim/netrw' " change location of netrw files

set wildignore+=*.RData,*.Rdata,*.RDS,*.rds        " R objects
set wildignore+=*.pdf,*.svg,*.jpg,*.png,*.jpeg     " readables
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/* " version control
set wildignore+=*.DS_Store                         " OSX

" VISUAL -----------------------------------------------------------------------

syntax enable          " syntax highlighting
colorscheme colors     " choose colorscheme
set synmaxcol=400      " color only the first 400 characters
set shortmess=I        " no startup message
set noshowcmd          " don't show commands
set encoding=utf-8     " UTF-8 char encoding
set foldcolumn=0       " hide fold column
set relativenumber     " show relative line numbers
set number             " show actual line number for the current line
set scrolloff=2        " keep 2 lines visible when scrolling
set list               " display whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set fillchars=stl:-,stlnc:-,fold:·,diff:─,vert:│
set statusline=%=%f    " only show filename at the end of statusline

" MAPS =========================================================================

" REMAPS -----------------------------------------------------------------------

" no ex-mode
noremap Q <nop>

" exit from terminal mode
tnoremap <c-[> <c-\><c-n>

" make Y be consistent with C and D
noremap Y y$

" make ge more consistent
onoremap ge :execute "normal! " . v:count1 . "ge<space>"<cr>
onoremap gE :execute "normal! " . v:count1 . "gE<space>"<cr>

" always move by virtual lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" add moving by lines to jump list
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" turn off highlighting after starting search
nnoremap / :set nohlsearch <cr>/
nnoremap ? :set nohlsearch <cr>?

" n always searches forwards and N backwards
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" ; always goes forwards and : backwards
nnoremap <expr> ; getcharsearch().forward ? ';' : ','
nnoremap <expr> : getcharsearch().forward ? ',' : ';'

" backtick to enter commands
noremap ` :

" always back exact place
noremap ' `

" fix substitution repeat to reuse last flags
nnoremap & :&&<cr>
xnoremap & :&&<cr>

" undo/redo
noremap U <c-r>

" H K L J for moving to paragraph edge
nnoremap <silent> J :<c-u>call <sid>Move(0, 0)<cr>
nnoremap <silent> K :<c-u>call <sid>Move(1, 0)<cr>
vnoremap <silent> J :<c-u>call <sid>Move(0, 1)<cr>
vnoremap <silent> K :<c-u>call <sid>Move(1, 1)<cr>
onoremap J V:call <sid>Move(0, 0)<cr>
onoremap K V:call <sid>Move(1, 0)<cr>
noremap  H g^
noremap  L g_
noremap  gH g0
noremap  gL g$

" merge
noremap M J

" increment numbers
noremap + <c-a>
noremap - <c-x>

" backspace swaps buffers
nnoremap <bs> <c-^>

" tab and shift-tab to traverse jump list
nnoremap <tab> <c-o>
nnoremap <s-tab> <c-i>

" tab in insert mode triggers completions
inoremap <tab> <c-p>
inoremap <s-tab> <c-n>
" make enter insert the selected completion item
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

" disable some g operators in visual mode
vnoremap u <nop>
vnoremap U <nop>

" CONTROL ----------------------------------------------------------------------

" commands that toggle settings

" toggle hlsearch
nnoremap <silent> <c-_> :set hlsearch!<cr>

" toggle spell
nnoremap <silent> <c-s> :set spell!<cr>

" toggle cursorline/cursorcolumn
nnoremap <silent> <c-l> :set cursorline!<cr>
nnoremap <silent> <c-c> :set cursorcolumn!<cr>

" SPACE ------------------------------------------------------------------------

" commands for word/line under the cursor

" read manual
noremap <space>m K

" go to file
noremap <space>f gf

" go in and out of a tag
noremap <space>] <c-]>
noremap <space>[ <c-t>

" go to the first occurrence (definition)
noremap <space>d [<C-I>

" add word to a search register and highlight
nnoremap <space>n :keepjumps normal! *#<cr>:set hlsearch<cr>

" spelling suggestions
nnoremap <space>s z=

" READLINE ---------------------------------------------------------------------

" taken from tpope vim-rsi plugin
inoremap        <C-A> <C-O>^
cnoremap        <C-A> <Home>
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

" LEADER -----------------------------------------------------------------------

" open r terminal
nnoremap \|tr :keepjumps belowright 20split<cr>:terminal<space>R<space><cr><c-\><c-n><c-w>k

" ALT --------------------------------------------------------------------------

" working with windows

" move between windows
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')
endif

" create windows
nnoremap <a-J> <c-w>s<c-w>k
nnoremap <a-K> <c-w>s
nnoremap <a-H> <c-w>v
nnoremap <a-L> <c-w>v<c-w>h

" resize windows
nnoremap <left>  :3wincmd <<cr>
nnoremap <right> :3wincmd ><cr>
nnoremap <up>    :3wincmd +<cr>
nnoremap <down>  :3wincmd -<cr>

" open terminal window
nnoremap <a-t> :terminal<cr>

" open window in a new tab
nnoremap <a-o> :tabedit %<cr>
" close all windows except the current one
nnoremap <a-O> :only<cr>

" quit/write shortcuts
nnoremap <a-q> :q<cr>
nnoremap <a-Q> :q!<cr>
nnoremap <a-w> :w<cr>
nnoremap <a-W> :w!<cr>

" sudo write
nnoremap <a-S> :w !sudo tee % > /dev/null<cr>

" new scratch buffer
nnoremap <a-s> :Scratch<cr>

" refresh/reload
nnoremap <a-e> :edit<cr>
nnoremap <a-E> :edit!<cr>

" new empty buffer
nnoremap <a-n> :enew<cr>
nnoremap <a-N> :enew!<cr>

" remove buffer
nnoremap <a-d> :silent! Bdelete<cr>
nnoremap <a-D> :silent! Bdelete!<cr>

" MOVEMENTS --------------------------------------------------------------------

" move through jump list
noremap ]j <c-i>
noremap [j <c-o>

" move through change list
noremap ]c g,
noremap [c g;

" move through tab list
noremap ]t :tabnext<cr>
noremap [t :tabprevious<cr>
noremap ]T :tablast<cr>
noremap [T :tabfirst<cr>

" move through buffer list
noremap ]b :bnext<cr>
noremap [b :bprevious<cr>
noremap ]B :blast<cr>
noremap [B :bfirst<cr>

" move through argument list
noremap ]a :next<cr>
noremap [a :previous<cr>
noremap ]A :last<cr>
noremap [A :first<cr>

" move through location list
noremap ]l :lnext<cr>
noremap [l :lprevious<cr>
noremap ]L :llast<cr>
noremap [L :lfirst<cr>

" move through quickfix list
noremap ]q :cnext<cr>
noremap [q :cprevious<cr>
noremap ]Q :clast<cr>
noremap [Q :cfirst<cr>

" TEXT OBJECTS -----------------------------------------------------------------

" from kana plugin

" r-code chunk
call textobj#user#plugin('rchunk', {
\   'code': {
\     'pattern': ['\n```{r.*}\n', '\n```'],
\     'select-a': 'aR',
\     'select-i': 'iR',
\   },
\ })

" inline r-code chunk
call textobj#user#plugin('rinline', {
\   'code': {
\     'pattern': ['`r ', '`'],
\     'select-a': 'ar',
\     'select-i': 'ir',
\   },
\ })

" make j and k delete columns
onoremap j <C-v>j
onoremap k <C-v>k

" entire document
onoremap ae :<c-u>normal! ggVG<cr>
vnoremap ae :<c-u>normal! ggVG<cr>
onoremap ie :<c-u>normal! gg}{VG{}<cr>
vnoremap ie :<c-u>normal! gg}{VG{}<cr>

" line
onoremap <silent> <expr> al v:count==0 ? ":<c-u>normal! 0V$h<cr>" : ":<c-u>normal! V" . (v:count) . "jk<cr>"
vnoremap <silent> <expr> al v:count==0 ? ":<c-u>normal! 0V$h<cr>" : ":<c-u>normal! V" . (v:count) . "jk<cr>"
onoremap <silent> <expr> il v:count==0 ? ":<c-u>normal! ^vg_<cr>" : ":<c-u>normal! ^v" . (v:count) . "jkg_<cr>"
vnoremap <silent> <expr> il v:count==0 ? ":<c-u>normal! ^vg_<cr>" : ":<c-u>normal! ^v" . (v:count) . "jkg_h<cr>"

" searched pattern
onoremap a/ gn
vnoremap a/ gn
onoremap i/ gn
vnoremap i/ gn
onoremap a? gN
vnoremap a? gN
onoremap i? gN
vnoremap i? gN

" COMMANDS =====================================================================

" get r help
command! -nargs=1 Rhelp call Rhelp(<f-args>)

" scratch Buffer
command! Scratch enew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" get syntax highlighting term
command! -nargs=0 Highlight call Highlight()

" diff changes with respect to original file
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" AUTOCOMMANDS =================================================================

" collumn limit
augroup collumn_limit
  autocmd!
  autocmd BufEnter,WinEnter * highlight CollumnLimit ctermbg=15 ctermfg=0
  autocmd BufEnter,WinEnter * if &diff | highlight CollumnLimit ctermbg=NONE ctermfg=NONE | endif
  autocmd FileType * highlight CollumnLimit ctermbg=8 ctermfg=0
  autocmd FileType * match CollumnLimit /\%81v./
augroup END

" r help
augroup r_keywordprg
  autocmd!
  autocmd FileType r setlocal keywordprg=:Rhelp
  autocmd FileType rmd setlocal keywordprg=:Rhelp
  autocmd FileType rmarkdown setlocal keywordprg=:Rhelp
augroup END

" no line numbers in terminal
augroup terminal_line_numbers
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" jump to last known line when opening files
augroup restore_cursor_line
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" FUNCTIONS ====================================================================

function! Highlight()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction

function Rhelp(rfunction)
  " if &buftype !=# "nofile"
  "   :100vsplit
  " endif
  enew
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  let l:fun = split(a:rfunction, "::")
  " form R call
  let rcall = "Rscript -e "
  if len(l:fun) < 2
    let string = rcall . "'help(" . l:fun[0] . ")'"
  else
    let string = rcall . "'help(" . l:fun[1] . ", package=\"" . l:fun[0] . "\")'"
  endif
  execute '0,$r! ' . string
  " cleanup
  set ft=r
  g/\b/exec "normal! 0\"rC\<c-R>r"
  silent StripTrailingWhitespace
  :0d
endfunction

" Adapted from https://vi.stackexchange.com/a/8917/307
function! s:Move(isUp, isInVisual)
  if a:isInVisual
    normal! gv
  end
  let curpos = getcurpos()
  let firstline='\(^\s*\n\)\zs\s*\S\+'
  let lastline ='\s*\S\+\ze\n\s*$'
  let flags = 'Wn'. (a:isUp ? 'b' : '')
  " Move to first or last line of paragraph, or to the beginning/end of file
  let pat = '\('.firstline.'\|'.lastline.'\)\|\%^\|\%$'
  " make sure cursor moves and search does not get stuck on current line
  call cursor(line('.'), a:isUp ? 1 : col('$'))
  let target=search(pat, flags)
  if target > 0
    let curpos[1]=target
    let curpos[2]=curpos[4]
  end
  call setpos('.',curpos)
endfu


nnoremap ,H :execute "normal! I" . &commentstring[0] . ' ' . repeat('=', 78)<cr>3\|R
nnoremap ,h :execute "normal! I" . &commentstring[0] . ' ' . repeat('-', 78)<cr>3\|R

