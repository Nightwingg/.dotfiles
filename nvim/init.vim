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
  Plug 'plasticboy/vim-markdown', {'for' :'markdown'}
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
"
" Move between buffers
map <leader><Tab> :bnext<CR>
map <leader><S-Tab> :bprevious<CR>

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

" Start terminal
nnoremap <c-t> :!wt -w 0 nt -d .<CR><CR>
nnoremap <leader>e :!start .<CR><CR>

" Color for non text
hi NonText ctermfg=DarkGray guifg=#50556b
hi SpecialKey ctermfg=DarkGray guifg=#50556b

" comandos
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
"nnoremap <leader>q :bd<cr>
nnoremap <leader>q :bp\|bd #<CR>
nnoremap <leader>Q :qa!<cr>
inoremap jj <ESC>
tnoremap jj <C-\><C-n>
nnoremap <ESC> :noh<CR><ESC>
nnoremap <leader>a ggVG
nnoremap <leader>sv :source $MYVIMRC<CR>

" Encoding, search y clipboard
set encoding=utf-8
set fileencoding=utf-8
set hidden

" cut, copy and paste
set clipboard=unnamed
set hlsearch
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <ESC>"+pa
vnoremap <C-v> c<ESC>"+p
nnoremap <C-v> "+p

" AutoComplete
set completeopt=noinsert,menuone,noselect
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>":"\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" paste in terminal mode
"tnoremap <C-v> <C-\><C-n>"ap
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>

" faster navigation
nnoremap <M-j> <C-w><C-j>
nnoremap <M-h> <C-w><C-h>
nnoremap <M-l> <C-w><C-l>
nnoremap <M-k> <C-w><C-k>
tnoremap <M-j> <C-\><C-n><C-w><C-j>
tnoremap <M-h> <C-\><C-n><C-w><C-h>
tnoremap <M-l> <C-\><C-n><C-w><C-l>
tnoremap <M-k> <C-\><C-n><C-w><C-k>
tnoremap <leader>q <C-\><C-n>:bd!<CR> " Cerrar terminal

" terminal
nnoremap <M-S-d> :vsp <bar> :term <CR>

" replace fast
nnoremap <Leader>r :%s///g<Left><Left> | :noh

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

" Keybindings
autocmd FileType rmd nnoremap <leader>cs I```{r chunkName, echo=FALSE, message=FALSE}<CR><CR>```<CR><Esc>kk
autocmd FileType Rmd nnoremap <leader>cs I```{r chunkName, echo=FALSE, message=FALSE}<CR><CR>```<CR><Esc>kk
autocmd FileType markdown nnoremap <leader>cs  I```python<CR><CR>```<CR><Esc>kk

" Files
map <Leader>p :FilesBetter<CR>
map <Leader>ob :Buffers<CR>
map <leader>ag :Ag<CR>

" braces
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>

" NertTree
nnoremap <leader>0 :NERDTreeFind<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let NERDTreeIgnore=['\.git$', '.mypy_cache', '.ipynb','__pycache__', '\.vscode$', '\.history$'] " Start NERDTree and leave the cursor in it.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup refreshNERDTree
    autocmd!
    autocmd BufEnter NERD_tree_* NERDTreeRefreshRoot
augroup END

" Coc utils
imap <C-l> <Plug>(coc-snippets-expand)
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent><nowait> <space>o :<C-u>CocList -I symbols<cr>
nmap <leader>sd :CocDiagnostic<cr>
" Disable ale
let g:ale_linters = {
      \ 'python':['flake8']} 
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=E116'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_disable_lsp = 1

" Format code
nmap <leader>kf :ALEFix<CR> 
let g:ale_enabled = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_fixers = {'r': ['styler'], 
      \  'python':['black'],
      \  'cpp':['clang-format'],
      \  'sql':['sqlformat'],
      \  'yaml':['yamlfix'],
      \  'rmd':['styler'],
      \  'markdown':['remark-lint'],
      \  'json':['fixjson']}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetDirectories=['nvim\\UltiSnips']
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:NERDCustomDelimiters = {
  \ 'rmd': { 'left': '# ', 'right': '' },
  \ 'markdown': {'left': '#', 'right':''}
  \ }
 
" Multilin 
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-M-d>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"]          = '<C-J>'
let g:VM_maps["Select Cursor Up"]            = '<C-K>'
    
" Compile
augroup compileandrun
    autocmd!
    " Vertical
    autocmd filetype python nnoremap <leader>xx :!cmd.exe /C "start "" cmd /c ""pypy3 % ^& echo. ^& pause"""<CR> 
    autocmd filetype python nnoremap <leader>xy :vnew term:// -c 'python3 %'<CR>a
    "autocmd filetype python nnoremap <leader>xy :vertical terminal pypy3 % <CR> 
    autocmd filetype rmd nnoremap <f6> :w <bar> !Rscript -e "rmarkdown::render('%')" <CR> i
  autocmd filetype cpp nnoremap <leader>xx :w <bar> !g++ -std=c++14 -O2 -Wall %<CR>
  autocmd filetype cpp nnoremap <leader>xy :!cmd.exe /C "start "" cmd /c ""a.exe ^& echo. ^& pause"""<CR> 
  " https://stackoverflow.com/questions/34698230/how-to-run-multiple-commands-via-start-command/34698365
  autocmd filetype cpp nnoremap <leader>xv :vnew term:// -c './a.exe' <cr>a
  autocmd filetype cpp nnoremap <leader>xh :new <bar> :resize17 term//powershell.exe -c "a.exe" <cr>a
  " Horizontal
    autocmd filetype python nnoremap <leader>xv :vnew term://zsh -c 'python3 %'<CR>a
    autocmd filetype python nnoremap <leader>xs :vertical terminal pypy3 % <CR> 
augroup END

" Run Files
autocmd filetype python nmap sf :let @+='%run '.expand('%')<CR>
autocmd filetype rmd nmap sf :let @+='rmarkdown::render("'.expand('%').')"'<CR>
autocmd filetype r nmap sf :let @+='source("'.expand('%:s?\\?\/?').'")'<CR>

" Markdown chunks
autocmd FileType rmd nnoremap <leader>cs I```{r chunkName, echo=FALSE, message=FALSE}<CR><CR>```<CR><Esc>kk
autocmd FileType markdown nnoremap <leader>cs  I```<CR><CR>```<CR><Esc>kk

" Text Objects
call textobj#user#plugin('markdown', {
\   'r': {
  \     'pattern': ['FALSE\}', '\`\`\`'],
\     'select-a': 'aa',
\     'select-i': 'ia',
\   },
\   'py': {
  \     'pattern': ['\`\`\`python', '\`\`\`'],
\     'select-a': 'aa',
\     'select-i': 'ia',
\   },
\ })
autocmd FileType rmd nmap cc v<Plug>(textobj-markdown-r-i)y
autocmd FileType rmd nmap cc v<Plug>(textobj-markdown-r-i)y
autocmd FileType markdown nmap cc v<Plug>(textobj-markdown-py-i)y
autocmd FileType markdown nmap cc v<Plug>(textobj-markdown-py-i)y

" Preview
"let g:fzf_layout = { 'down': '30%' }
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'head {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'head {}']}, <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>,'--path-to-ignore ~/.ignore --hidden', 
      "\ fzf#vim#with_preview(), <bang>0)

function! s:FilesBetter()
  if filereadable(".gitignore")
    :GFiles
  else
    :Files
  endif
endfunction
command! -nargs=* FilesBetter call s:FilesBetter()

let curly = "}"
inoremap <expr> } CheckNextParens(curly)

let bracket = "]"
inoremap <expr> ] CheckNextParens(bracket)

let parens = ")"
inoremap <expr> ) CheckNextParens(parens)

let quote = "'"
inoremap <expr> ' CheckNextQuote(quote)

let dquote = '"'
inoremap <expr> " CheckNextQuote(dquote)

let bticks = '`'
inoremap <expr> ` CheckNextQuote(bticks)

function CheckNextQuote(c)
  let after = col('.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  
  if (afterChar == a:c)
    return "\<right>"
  endif
  if (afterChar == ' ' || afterChar == '' || afterChar == ')' || afterChar== '}' || afterChar == ']')
    return a:c . a:c . "\<left>"
  endif
  if (afterChar != a:c)
    let bticks = '`'
    let dquote = '"'
    let quote = "'"
    if(afterChar == dquote || afterChar == quote || afterChar == bticks)
      return a:c . a:c . "\<left>"
    endif
  endif
  return a:c
endfunction

function CheckNextParens(c)
  let after = col('.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  if (afterChar == a:c)

    return "\<right>"
  endif
  return a:c
endfunction

inoremap <expr> <CR> ParensIndent()
function! ParensIndent()
  let prev = col('.') - 1
  let after = col('.')
  let prevChar = matchstr(getline('.'), '\%' . prev . 'c.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  if (prevChar == '"' && afterChar == '"') ||
\    (prevChar == "'" && afterChar == "'") ||
\    (prevChar == "(" && afterChar == ")") ||
\    (prevChar == "{" && afterChar == "}") ||
\    (prevChar == "[" && afterChar == "]")
    return "\<CR>\<ESC>O"
  endif
  
  return "\<CR>"
endfunction
 
