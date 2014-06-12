" neocomplete.vim -------------------------------------------------------------
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Enable
let g:neocomplete#enable_at_startup = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3

au VimEnter * NeoCompleteEnable

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
    " \ 'default' : '',
    " \ 'vimshell' : $HOME.'/.vimshell_hist'
    " \ }

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <CR> -- close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <expr><Tab>  neocomplete#start_manual_complete()
" <C-h>, <BS>: close popup and delete backword char.
" **Modified to work with delimitMate.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <silent> <expr><C-h> neocomplete#smart_close_popup().delimitMate#BS()
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <silent> <expr><BS> neocomplete#smart_close_popup().delimitMate#BS()
inoremap <silent> <expr><C-y>  neocomplete#close_popup()
inoremap <silent> <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <silent> <expr><Space> pumvisible() ? neocomplete#close_popup()."<Space>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
