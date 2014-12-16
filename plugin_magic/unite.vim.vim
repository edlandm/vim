" Unite Settings ===========================================================
"==============================================================================
" Window Width
let g:unite_enable_split_vertically = 1
let g:unite_enable_short_source_names = 1
let g:unite_winwidth = 50

" Enable yank history
let g:unite_source_history_yank_enable = 1

" Set Bookmark directory
let g:unite_source_bookmark_directory = $HOME . "/.vim/bookmarks"
"call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Opens Unite
nnoremap <Tab><Tab> :Unite -start-insert file_rec<CR>
" Open Unite to grep current directory
nnoremap <silent> <Tab>/ :Unite -horizontal -direction=below -auto-resize -auto-preview grep:.<CR>
" Open Unite to grep current buffer
nnoremap <silent> <Tab>? :Unite -horizontal -direction=below -auto-resize -auto-preview grep:%<CR>
" Opens Unite to list of bookmarks and buffers
nnoremap <silent> <Tab>b :Unite -horizontal -direction=below -start-insert buffer bookmark<CR>
" Open list of recently accessed directories
" *Selecting one changes working directory*
" nnoremap <silent> <Tab>d :Unite -buffer-name=Directories -default-action=lcd -start-insert directory<CR>
" Opens Unite and searches for word under cursor
"nnoremap <silent> <Tab>. :UniteWithCursorWord file buffer file_rec<CR>
" Open list of recently accessed files
nnoremap <silent> <Tab>f :Unite -horizontal -direction=below file<CR>
" Add current file to bookmarks list
nnoremap <silent> <Tab>B :UniteBookmarkAdd<CR><CR>
" Open yank history (default action is to yank)
nnoremap <silent> <Tab>y :Unite -horizontal -buffer-name=yank -winheight=5
                         \-default-action=yank history/yank<CR>
" Search plugins (neobundle required)
nnoremap <silent> <Tab>n :Unite neobundle/search<CR>
