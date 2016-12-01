set nocindent
set wrap
set linebreak
set nolist
set formatoptions+=1
set shiftwidth=2
set tabstop=2

" Highlight markers
" Conceal "**" markers
" au Syntax text syn match Entity "\*\*" conceal
au Syntax text syn match Ignore "\*\*" conceal
au Syntax text syn match Todo /\*\*\_.\{-}\*\*/ contains=Ignore
" Highlight quotations
au Syntax text syn match String /"\_.\{-}"/

" Print new section
let @s="#==============================================================================={{{\n
        \#===============================================================================\n
        \#===============================================================================}}}\n"
nnoremap <leader>s "sp
nnoremap <leader>S "sP

" Surround selection with "**"
"
vnoremap <leader>h <ESC>`<i**<ESC>`>lla**<ESC>gv
