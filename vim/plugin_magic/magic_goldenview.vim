" The default mappings throw off my groove
let g:goldenview__enable_default_mapping = 0

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
