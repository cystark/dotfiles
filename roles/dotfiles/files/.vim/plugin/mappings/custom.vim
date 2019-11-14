autocmd FileType typescript setlocal formatprg=eslint\ --parser\ typescript

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'python': ['flake8'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'python': ['yapf', 'remove_trailing_lines', 'isort', 'ale#fixers#generic_python#BreakUpLongLines'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'css': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" Load file with js alias on gf

set path=.,src
set suffixesadd=.js,.jsx,.ts,.tsx

function! LoadMainNodeModule(fname)
  return path
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
