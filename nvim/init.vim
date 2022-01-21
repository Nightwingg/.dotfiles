call plug#begin('~/AppData/local/nvim/plugged')
  Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'SirVer/ultisnips'
  Plug 'dense-analysis/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'godlygeek/tabular', {'for': 'markdown'}
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'vim-pandoc/vim-rmarkdown'
  Plug 'kana/vim-textobj-user'
call plug#end()

" Mouse 
set mouse=a
"" Terminal
"let $TMP="/tmp"
"if has("win32")
"let &shell='powershell.exe'
 "let &shellcmdflag = '-c'
 "let &shellredir = '>%s 2>&1'
 "set shellquote= shellxescape=
 "" set noshelltemp
 "set shellxquote=
 "let &shellpipe='2>&1| tee'
"endif
"
" Alias
let $BASH_ENV = "~/.bash_aliases"

" colors
syntax on
set laststatus=2

" confirm save
set confirm

" Split default
set splitbelow " split default abajo
set splitright " split default derecha
set noswapfile
let mapleader=" "

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" Relative numbers
set number
set relativenumber

set textwidth=85
set wrapmargin=2
set numberwidth=6
set wrap
set shiftwidth=2
set textwidth=90
set expandtab
set tabstop=2
set softtabstop=2
"
" Indent
set listchars=eol:¬,space:·,tab:>·,trail:~,extends:>,precedes:<
set list
set fillchars+=vert:╵

" Color for non text
hi NonText ctermfg=DarkGray guifg=#50556b
hi SpecialKey ctermfg=DarkGray guifg=#50556b

" Encoding, search y clipboard
set encoding=utf-8
set fileencoding=utf-8
set hidden

" cut, copy and paste
set clipboard=unnamedplus
set hlsearch

" AutoComplete
set completeopt=noinsert,menuone,noselect

au BufNewFile,BufRead *.R,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html,*.rmd,*.vim,*.vimrc
    \ set shiftwidth=2 |
    \ set tabstop=2|
    \ set textwidth=90 |
    \ set softtabstop=2|
    \ set expandtab |
    \ set ff=unix |
    \ set fo+=t|
    \ set wrap |
    \ set nospell

au BufNewFile,BufRead *.md,*.markdown
    \ set shiftwidth=4 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set ff=unix |
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set fo+=t|
    \ set wrap |
    \ set nospell

au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 | 
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set nospell

" Imports "{{{
" ---------------------------------------------------------------------
so ~/.config/nvim/plug_config.vim
so ~/.config/nvim/maps.vim
