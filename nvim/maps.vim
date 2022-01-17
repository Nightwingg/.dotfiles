" Move between buffers
map <leader><Tab> :bnext<CR>
map <leader><S-Tab> :bprevious<CR>
"
" Varios
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :bp\|bd #<CR>
nnoremap <leader>Q :qa!<cr>
nnoremap Q :qa!<cr>
inoremap jj <ESC>
tnoremap jj <C-\><C-n>
nnoremap <ESC> :noh<CR><ESC>
nnoremap <leader>a ggVG
nnoremap <leader>sm :source $MYVIMRC<CR>

" cut, copy and paste
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <ESC>"+pa
vnoremap <C-v> c<ESC>"+p
nnoremap <C-v> "+p

" Autocomplete
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>":"\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>

" faster navigation
nnoremap <leader>sj <C-w><C-j>
nnoremap <leader>sh <C-w><C-h>
nnoremap <leader>sl <C-w><C-l>
nnoremap <leader>sk <C-w><C-k>
nnoremap <M-w> <C-w>w
tnoremap <leader>sj <C-\><C-n><C-w><C-j>
tnoremap <leader>sh <C-\><C-n><C-w><C-h>
tnoremap <leader>sl <C-\><C-n><C-w><C-l>
tnoremap <leader>sk <C-\><C-n><C-w><C-k>
tnoremap <leader>q <C-\><C-n>:bd!<CR>

" Splits
nmap <leader>ss :split <bar> <C-w>w <CR>
nmap <leader>sv :vsplit <bar> <C-w>w <CR>

" replace fast
nnoremap <Leader>r :%s///g<Left><Left> | :noh

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

" Coc utils
imap <C-l> <Plug>(coc-snippets-expand)
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent><nowait> <space>o :<C-u>CocList -I symbols<cr>
nmap <leader>sd :CocDiagnostic<cr>

" Format code
nmap <leader>kf :ALEFix<CR> 

" Run Files
autocmd filetype python nmap sf :let @+='%run '.expand('%')<CR>
autocmd filetype rmd nmap sf :let @+='rmarkdown::render("'.expand('%').')"'<CR>
autocmd filetype r nmap sf :let @+='source("'.expand('%:s?\\?\/?').'")'<CR>

" objects 
autocmd FileType rmd nmap cc v<Plug>(textobj-markdown-r-i)y
autocmd FileType rmd nmap cc v<Plug>(textobj-markdown-r-i)y
autocmd FileType markdown nmap cc v<Plug>(textobj-markdown-py-i)y
autocmd FileType markdown nmap cc v<Plug>(textobj-markdown-py-i)y

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

function! s:FilesBetter()
  if filereadable(".gitignore")
    :GFiles
  else
    :Files
  endif
endfunction
command! -nargs=* FilesBetter call s:FilesBetter()

" curlys and brackets
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
