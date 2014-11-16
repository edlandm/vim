" Snippets directory
" one of these lines does the trick
let g:UltiSnipsSnippetsDir="~/.vim/usnippets"
let g:UltiSnipsSnippetDirectories=["usnippets"]

nnoremap <leader>ue :UltiSnipsEdit<cr>

silent! unmap <c-n>
silent! unmap <c-p>
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

let g:UltiSnipsEditSplit="horizontal"
