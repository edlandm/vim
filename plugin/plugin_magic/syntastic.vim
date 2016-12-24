" Syntastic Settings =========================================================
"==============================================================================
" Run syntax checks
nnoremap <F7> :SyntasticCheck<cr>

" Set default mode to be passive (no automatic checks will be performed)
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': [] }

" Disable checking on write-quit
let g:syntastic_check_on_wq = 0
" Which syntax checkers to use
let g:syntastic_ada_checkers = ['gcc']
let g:syntastic_c_checkers = ['make']
let g:syntastic_cs_checkers = ['mcs']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_javascript_checkers = ['jsl']
let g:syntastic_objc_checkers = ['gcc']
let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_sh_checkers = ['sh']
let g:syntastic_zsh_checkers = ['zsh']
let g:syntastic_go_checkers = ['go']
