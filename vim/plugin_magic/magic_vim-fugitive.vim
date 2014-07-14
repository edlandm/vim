" Commit
nnoremap <leader>gcc :Gcommit -v<cr>
" Commit -m
nnoremap <leader>gcm :Gcommit -m ""<left>
" Commit --amend
nnoremap <leader>gca :Gcommit -v --amend<cr>
" Push
nnoremap <leader>gp :Gpush<cr>
" Pull
nnoremap <leader>gl :Gpull<cr>
" Open Git DiffMode
nnoremap <leader>gd :Gdiff<cr>
" Git Status
nnoremap <leader>gs :Gstatus<cr>
" Git Blame
nnoremap <leader>gb :Gblame<cr>
vnoremap <leader>gb :'<,'>Gblame<cr>
" Gwrite (git add current file)
nnoremap <leader>gw :Gw<cr>:w<cr>
nnoremap <leader>ga :Gw<cr>
