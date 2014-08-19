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
" Git stash, stash pop
nnoremap <leader>gst :Git stash<cr>
nnoremap <leader>gsp :Git stash pop<cr>
" Git Blame
nnoremap <leader>gb :Gblame<cr>
vnoremap <leader>gb :Gblame<cr>
" Gwrite (git add current file)
nnoremap <leader>gw :Gw<cr>:w<cr>
nnoremap <leader>ga :Gw<cr>
" Open log of last 20 commits in new split
nnoremap <leader>gls :new
            \<cr>:setlocal buftype=nofile
            \<cr>:setlocal ft=css
            \<cr>:.! git log -n 20 --graph --pretty=format:"\%h \%an \%s"<cr>
" Open log of all commits since last pull
nnoremap <leader>glts :new
            \<cr>:setlocal buftype=nofile
            \<cr>:setlocal ft=css
            \<cr>:.! git log @{1}.. --pretty=format:"\%h \%an \%s"<cr>
" Git cherry-pick
nnoremap <leader>gcp :Git cherry-pick<space>

" There's also a mapping nnoremap <leader>gm :Merginal
" for git merge, that's in the merginal plugin file though.
