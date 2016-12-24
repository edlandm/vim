" The default mappings throw off my groove
let g:goldenview__enable_default_mapping = 0

" I can't tell if the above command actually works, it's still messing with
" one of my mappings.
unmap <C-L>
nnoremap <C-L> <C-W>l

" Split to tiled windows
nmap <silent> <leader><space> <Plug>GoldenViewSplit

" Quickly switch currend window with the main pane
nmap <silent> <leader>M <Plug>GoldenViewSwitchMain
nmap <silent> <leader>m <Plug>GoldenViewSwitchToggle

let g:goldenview__ignore_urule =
            \{
            \   'filetype': [
            \       '', 'qf', 'tagbar', 'nerdtree', 'unite',
            \   ],
            \   'unitebuftype' : [
            \       'nofile',
            \   ],
            \ }
