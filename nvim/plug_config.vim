" NertTree
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

" Disable ale
let g:ale_linters = {
      \ 'python':['flake8']} 
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=E116'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_disable_lsp = 1

" Ale
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

" Preview
let g:fzf_layout = { 'down': '30%' }
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'head {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'head {}']}, <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>,'--path-to-ignore ~/.ignore --hidden', 
      "\ fzf#vim#with_preview(), <bang>0)


