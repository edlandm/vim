" Airline Settings ============================================================
"==============================================================================
"set theme
let g:airline_theme='tomorrow'

let g:airline_powerline_fonts=0

" enable tagbar integration
let g:airline#extensions#tagbar#enabled = 1

" enable fugitive integration
let g:airline#extensions#branch#enabled = 1

" enable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" enable tmuxline integration
let g:airline#extensions#tmuxline#enabled = 1
" set snapshot file
let g:airline#extensions#tmuxline#snapshot_file = "~/.tmuxline"

" enable promptline integration
let g:airline#extensions#promptline#enabled = 1

" enable NrrwRgn integration
let g:airline#extensions#nrrwrgn#enabled = 1
