" MultiCursor Settings =========================================================
"===============================================================================
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" MultiCursor without gui vim is terribly laggy, you don't want it with
" terminal vim
if !has('gui') |
    let g:multi_cursor_use_default_mapping=0 |
endif |
