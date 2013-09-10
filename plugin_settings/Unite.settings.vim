" Unite Settings ===========================================================
"==============================================================================
" Window Width
let g:unite_enable_split_vertically = 1
let g:unite_enable_use_short_source_names = 1
let g:unite_winwidth = 50

" Opens Unite
nnoremap <Tab><Tab> :Unite -start-insert file_rec/async<CR>
" Open unity to grep
nnoremap <silent> <Tab>/ :Unite -horizontal -direction=below -auto-resize -auto-preview grep:
" Quick buffer switching
nnoremap <silent> <Tab>b :Unite -horizontal -direction=below -start-insert -default-action=goto buffer<CR>
" Open list of recently accessed directories
" Selecting one changes working directory
nnoremap <silent> <Tab>d :Unite -buffer-name=files -default-action=lcd directory_mru<CR>
" Opens unity and searches for word under cursor
nnoremap <silent> <Tab>. :UniteWithCursorWord file buffer file_rec<CR>
" Open list of recently accessed files
nnoremap <silent> <Tab>f :Unite -horizontal -direction=below file_mru<CR>
" Open list of bookmarks
nnoremap <silent> <Tab>h :Unite -start-insert bookmark<CR>
" Add current file to bookmarks list
nnoremap <silent> <Tab>] :UniteBookmarkAdd<CR><CR>
