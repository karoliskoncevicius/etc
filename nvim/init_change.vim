filetype indent plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('$XDG_LIB_HOME/nvim/plugins')

" utilities
Plug 'joereynolds/vim-minisnip'
Plug 'tpope/vim-rsi'

" integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'tommcdo/vim-lion'
Plug 'KKPMW/vim-sendtowindow'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-lastpat'
Plug 'glts/vim-textobj-comment'
Plug 'Julian/vim-textobj-variable-segment'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" PLUGIN SETTINGS """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " netrw
let g:netrw_home=$XDG_DATA_HOME.'/nvim/netrw' " change location of netrw files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" SETTINGS """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $BASH_ENV = '$XDG_CONFIG_HOME/bash/aliases' " bashrc location with aliases.

"""""""""""""""""""""""""""""""""" BEHAVIOUR """""""""""""""""""""""""""""""""""

set nrformats=    " treat all numbers as decimal
set hidden        " don't issue warnings when using :bnext on edited buffer
set nojoinspaces  " don't add spaces when joining lines

set splitright         " open new horizontal splits on the rights
set splitbelow         " open new vertical splits on the bottom
set noequalalways      " don't resize other windows after closing a window
set diffopt+=vertical  " diff splits are done vertically

set shiftwidth=2      " number of spaces per indent level
set tabstop=2         " number of spaces per tab
set expandtab         " spaces instead of tabs
set backspace=2       " sane backspace options

set incsearch     " incremental search
set nohlsearch    " don't highlight after searching
set nowrapscan    " don't continue search at the top

set cpoptions-=_       " make cw consistent
set inccommand=nosplit

set undofile                             " enable persistent undo
set backup                               " enable backup
set backupdir=$XDG_DATA_HOME/nvim/backup " set and create backupdir
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

set path=.,**                                      " recursive path for 'find'
set wildignore+=*.RData,*.Rdata,*.RDS,*.rds        " R objects
set wildignore+=*.pdf,*.svg,*.jpg,*.png,*.jpeg     " readables
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/* " version control
set wildignore+=*.DS_Store                         " OSX

"""""""""""""""""""""""""""""""""""" VISUAL """"""""""""""""""""""""""""""""""""

syntax enable                     " syntax highlighting
set synmaxcol=400                 " color only the first 400 characters
set encoding=utf-8                " UTF-8 char encoding
set foldcolumn=0                  " hide fold column
set relativenumber                " show relative line numbers
set number                        " show actual line number for the current line
set scrolloff=2                   " keep 2 lines visible when scrolling
set list                          " display whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set breakindent                   " break long lines
set showbreak=\\\\\               " broken lines are indented
set shortmess=I                   " no startup message
set fillchars=vert:│,fold:·       " character used for vertical splits
set statusline=%=%f               " only show filename at the end of statusline
set noshowcmd                     " don't show commands
colorscheme colors                " choose colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""" MAPS """""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""" REMAPS """"""""""""""""""""""""""""""""""""

" exit from terminal mode
tnoremap <c-[> <c-\><c-n>

" make Y be consistent with C and D
noremap Y y$

noremap o a
noremap O A
noremap <a-i> O
noremap <a-o> o
noremap <silent><a-I> :set paste<CR>m`O<Esc>``:set nopaste<CR>
noremap <silent><a-O> :set paste<CR>m`o<Esc>``:set nopaste<CR>

noremap L g_
noremap H ^
noremap <a-L> $
noremap <a-H> 0

noremap <a-j> gj
noremap <a-k> gk

noremap U <c-r>
noremap <a-u> U

noremap + <c-a>
noremap - <c-x>

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

nnoremap <silent> J :<c-u>call <sid>Move(0, 0)<cr>
nnoremap <silent> K :<c-u>call <sid>Move(1, 0)<cr>
vnoremap <silent> J :<c-u>call <sid>Move(0, 1)<cr>
vnoremap <silent> K :<c-u>call <sid>Move(1, 1)<cr>
onoremap J V:call <sid>Move(0, 0)<cr>
onoremap K V:call <sid>Move(1, 0)<cr>
noremap <a-K> {
noremap <a-J> }

noremap <a-v> <c-v>

" taken from https://vi.stackexchange.com/a/15466/307
function! SuppressKey(key)
  let c = nr2char(getchar())
  if maparg(a:key.c, 'n') != ''
    return a:key.c
  else
    return '\<Nop>'
  endif
endfunction

noremap <expr> g SuppressKey('g')
noremap <expr> z SuppressKey('z')

noremap gg gg
noremap zz zz

nnoremap <c-d> <c-d>
nnoremap <c-u> <c-u>
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap <c-h> zt
nnoremap <c-l> zb

noremap w b
noremap W ge
noremap e e
noremap E w

noremap N /
noremap n n
noremap B ?
noremap b N

function! s:EndWord() abort
  let pos = getpos('.')
  normal! gee
  if pos == getpos('.')
    return v:true
  else
    call setpos('.', pos)
    return v:false
  endif
endfunction

" onoremap <silent> e :<c-u>call <sid>EndWord()<cr>
