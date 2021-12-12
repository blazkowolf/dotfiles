Plug 'dense-analysis/ale'

let g:ale_linters = {
\  'rust': ['analyzer']
\}

let g:ale_fixers = { 
\  'rust': [
\    'rustfmt', 
\    'trim_whitespace', 
\    'remove_trailing_lines'
\  ] 
\}

let g:ale_completion_enabled = 1

" let g:ale_sign_error = '\ufc38'
" let g:ale_sign_warning = '\uf071'

nnoremap <leader>de :ALEGoToDefinition<CR>

