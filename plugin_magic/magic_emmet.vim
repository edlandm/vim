" Only emable emmet in insert mode to avoid mapping conflicts
let g:user_emmet_mode='i'

" Expand emmet expressions with tab or go to next element
function! s:emmet_html_tab()
    let line = getline('.')
    " If line is already html, jump to the next element
    if match(line, '<.*>') >= 0
        return "\<c-y>n"
    endif
    " Otherwise expand the emmet expression
    return "\<c-y>,"
endfunction
au FileType html imap <buffer><expr><tab> <sid>emmet_html_tab()
au FileType htmldjango imap <buffer><expr><tab> <sid>emmet_html_tab()
