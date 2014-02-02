" Promptline Vim settings
let g:promptline_theme = 'airline'
let g:promptline_preset = {
    \'a' : [ promptline#slices#python_virtualenv() ],
    \'b' : [ promptline#slices#vcs_branch() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ '%*' ],
    \'z' : [ '%n@%m'],
    \'warn' : [ promptline#slices#last_exit_code() ]}
"let g:promptline_powerline_symbols = 0
let g:promptline_symbols = {
    \ 'left'       : '',
    \ 'left_alt'   : '',
    \ 'dir_sep'    : '/',
    \ 'truncation' : '...',
    \ 'vcs_branch' : '',
    \ 'space'      : ' '}
