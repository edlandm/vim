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

" Execute most recently executed macro
nnoremap Q @@

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
nnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy

" Paste from clipboard (and preserve indentation)
nnoremap <Leader>p :set paste<CR>:put +<CR>:set nopaste<CR>

" Toggle foldenable (un/folds all folds)
nnoremap <silent> zft :<C-U>set fen!

" Unimpaired mappings (Strongly inspired by tpope, some of this is borrowed) {{{
" Navigate files {{{
" Move through arglist
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>
" Move through buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
" Move to begining/end of fold region
nnoremap [f [z
nnoremap ]f ]z
" Move through tabs
nnoremap [t :tabN<CR>
nnoremap ]t :tabn<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>
" Move (reorder) tabs; [m = left; ]m = right
nnoremap [m :tabm -<CR>
nnoremap ]m :tabm +<CR>
" Zoom window; To unzoom simply close the window/tab
nnoremap [z :tabedit %<CR>
"}}}
" Line Operations {{{
" Add [count] lines above cursor
nnoremap ]<space> o<ESC>'[k
" Add [count] lines below cursor
nnoremap [<space> O<ESC>j
" Move Functions (Used for the next four mappings) {{{
function! Move(cmd, count, map) abort
  normal! m`
  exe 'move'.a:cmd.a:count
  norm! ``
  silent! call repeat#set("Move".a:map, a:count)
endfunction

function! MoveSelectionUp(count) abort
  normal! m`
  exe "'<,'>move'<--".a:count
  norm! ``
  silent! call repeat#set("MoveSelectionUp", a:count)
endfunction

function! MoveSelectionDown(count) abort
  normal! m`
  exe "'<,'>move'>+".a:count
  norm! ``
  silent! call repeat#set("MoveSelectionDown", a:count)
endfunction
" }}}
" Exchange current line with [count] lines above it
nnoremap <silent> [e :<C-U>call Move('--',v:count1,'Up')<CR>
" Exchange current line with [count] lines below it
nnoremap <silent> ]e :<C-U>call Move('+',v:count1,'Down')<CR>
" Exchange current selection with [count] lines above it
vnoremap <silent> [e :<C-U>call MoveSelectionUp(v:count1)<CR>gv
" Exchange current selection with [count] lines below it
vnoremap <silent> ]e :<C-U>call MoveSelectionDown(v:count1)<CR>gv
" }}}
" Editing Operations ==========================================================={{{
"===============================================================================
" Go to previous text state
nnoremap [u g-
" Go to next text state
nnoremap ]u g+
"===============================================================================}}}
" Toggle settings {{{
" [o = on; ]o = off; co = toggle
let settings = {
            \ 'c': 'cursorline',
            \ 'h': 'hlsearch',
            \ 'l': 'list',
            \ 'n': 'number',
            \ 'r': 'relativenumber',
            \ 's': 'spell',
            \ 'u': 'cursorcolumn',
            \ 'w': 'wrap',
            \ }

for [key, val] in items(settings)
    exec printf("nnoremap <silent> [o%s :<C-U>set %s<CR>", key, val)
    exec printf("nnoremap <silent> ]o%s :<C-U>set no%s<CR>", key, val)
    exec printf("nnoremap <silent> co%s :<C-U>set %s!<CR>", key, val)
endfor
" }}}
" Windows {{{
" Decrease window height (by 5)
nnoremap [w :<C-U>resize -5<CR>
" Increase window height (by 5)
nnoremap ]w :<C-U>resize +5<CR>
" Decrease window width (by 5)
nnoremap [W :<C-U>vertical resize -5<CR>
" Increase window width (by 5)
nnoremap ]W :<C-U>vertical resize +5<CR>
" Split window horizontally
nnoremap [s :<C-U>sp<CR>
" Split window vertically
nnoremap ]s :<C-U>vsp<CR>
" }}}
" }}}
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

" Make movement in visual mode more like how I have it in normal mode
vnoremap H ^
vnoremap L $

"==============================================================================}}}
" Misc ========================================================================{{{
"==============================================================================
" unmap <Tab>

"==============================================================================}}}
