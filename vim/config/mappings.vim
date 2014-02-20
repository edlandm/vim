set fdm=marker
"=================================  Mappings  =================================
" Leader Mappings ============================================================= {{{
"==============================================================================
" Maps leader key to ,
let mapleader = ","

" Toggle relative/absolute line-numbers
function! RelNumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
"nmap <silent> <Leader>1 :call LineNumberToggle()<CR>

" Toggle line-numbers
function! LineNumberToggle()
    if(&relativenumber == 1)
        set invrelativenumber
    elseif(&number == 1)
        set invnumber
    else
        set number
    endif
endfunc
"nmap <silent> <Leader>2 :call RelNumberToggle()<CR>

" Insert blank lines without going into insert mode
nnoremap <Leader>o o<ESC>k
nnoremap <Leader>O O<ESC>j

" Toggle search highlighting
nnoremap <silent> <Leader>h :set hlsearch!<CR>

" Search and replace selected text
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"==============================================================================}}}
" Normal Mode Mappings ========================================================{{{
"==============================================================================
" Re-sources .vimrc
nnoremap <silent><F5> <ESC>:source $MYVIMRC<CR>

" Re-set syntax highlighting
nnoremap <silent><F6> <ESC>:syntax sync fromstart<CR>

" Easier Split Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Next two enable faster scrolling with <C-e> and <C-y>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Jump to start and end of line using homerow keys
nnoremap H ^
nnoremap L $

" Makes 'Enter' insert a <CR> it's like the opposite of J
nnoremap <C-m> i<C-m><Esc>

" Execute Macros with Q
nnoremap Q @q

" Maps ' to ` so that it jumps to line AND column of mark. It's just easier to
" than hitting ` (it also eliminates the need to excape it from tmux)
nnoremap ' `

" Y yanks to end of line, making it consistant with D and C
nnoremap Y y$

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" Remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Select last pasted text
nnoremap gV `[v`]

" Yank text to clipboard (Works on OS X)
noremap <Leader>y "+y
noremap <Leader>yy "+yy

" Paste from clipboard (and preserve indentation)
noremap <Leader>p :set paste<CR>:put +<CR>:set nopaste<CR>

" Ctrl+o and Ctrl+i move line up/down
nnoremap <silent><C-i> mz:m+<CR>`z
nnoremap <silent><C-o> mz:m-2<CR>`z

" Open new tab
nnoremap <silent> <Leader>[n :tabnew<CR>
" Switch to next tab
nnoremap <silent> <Leader>[] :tabnext<CR>
" Switch to previous tab
nnoremap <silent> <Leader>[[ :tabprevious<CR>
" Close Tab
nnoremap <silent> <Leader>[c :tabclose<CR>

"==============================================================================}}}
" Insert Mode Mappings ========================================================{{{
"==============================================================================

" A quicker alternative to pushing <ESC>
inoremap jk <ESC> `^
inoremap kj <ESC> `^

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Next two set indenting in insert-mode
inoremap << <C-d>
inoremap >> <C-t>

" Go to beginning of line in insert mode
inoremap <C-a> <ESC>I

" Go to end of line in insert mode
inoremap <C-e> <ESC>A

" Move current line up one line (switches places with above line)
inoremap <silent><C-k> <ESC>mz:m-2<CR>`zi

" Move current line down one line (switches places with below line)
inoremap <silent><C-j> <ESC>mz:m+<CR>`zi

"==============================================================================}}}
" Command Mode Mappings ======================================================={{{
"==============================================================================
" Escape spaces in command-mode by pressing space twice
cnoremap <Space><Space> \<Space>

" Exit Insert-mode by pressing j+k together (order doesn't matter)
cnoremap jk <ESC> `^
cnoremap kj <ESC> `^
"==============================================================================}}}
" Visual Mode Mappings ========================================================{{{
"==============================================================================
" Yank highlighted text and searches it
vnoremap <C-n> y/<C-R>"<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Move current visual selection up or down
vnoremap <C-j> <ESC> `<gv:m '>+1<CR>gv
vnoremap <C-k> <ESC> `<gv:m '<-2<CR>gv

" Make movement in visual mode more like how I have it in normal mode
vnoremap H ^
vnoremap L $

"==============================================================================}}}
" Misc ========================================================================{{{
"==============================================================================
unmap <Tab>

"==============================================================================}}}
