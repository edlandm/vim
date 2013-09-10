" MiniBufExplorer Settings ====================================================
"==============================================================================
let g:miniBufExplBuffersNeeded = 1
" Allows buffer to cycle if it hits beginning or end of buffer list
let g:miniBufExplCycleArround = 1
" Ommit buffer number
let g:miniBufExplShowBufNumbers = 0
nnoremap <silent> <Leader>b :MBEToggle<CR>

" Buffer Navigation
" Use vim's builtin :<count>bu to jump to specific buffers

" Switch to next buffer
nnoremap <silent> <Leader>;' :MBEbn<CR>
" Switch to previous buffer
nnoremap <silent> <Leader>;; :MBEbp<CR>
" Close buffer
nnoremap <silent> <Leader>;d :MBEbw<CR>
" Previously edited buffer
nnoremap <silent> <Leader>;, :b#<CR>
