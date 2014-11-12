" vim:fdm=marker
"=================================  Mappings  =================================
" Leader Mappings ============================================================= "{{{
"==============================================================================
" Set leader key
let mapleader = "\<space>"
let maplocalleader = ","

" Search and replace selected text
function! CmdLine(str) "{{{
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction "}}}
function! VisualSelection(direction) range "{{{
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
endfunction "}}}
nnoremap <leader>r :%s/\<<C-r>=expand('<cword>')<cr>\>/
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Save the file
nnoremap <leader>w :w<CR>
" Quit the file
nnoremap <leader>q :q<CR>
" Help! 'I need somebody...'
nnoremap <leader>h :h<space>

" Make all windows equal size
nnoremap <leader>= <C-w>=
" Split window horizontally
nnoremap <leader>- :sp<CR>
" Split window vertically
nnoremap <leader>\| :vsp<CR>

" Pulse current line
nnoremap <leader><leader> :Pulse<cr>

" toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins() "{{{
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
    echo "Unzoom"
  else
    augroup maxCurrWin
        " au BufEnter * wincmd _ | wincmd |
        "
        " only max it vertically
        au! WinEnter * wincmd _
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
    echo "Zoom"
  endif
endfunction "}}}
nnoremap <leader>z :call ToggleMaxWins()<CR>

" Jump to next/previous change in diff mode
au BufEnter * if &diff
            \ | nnoremap <leader>c ]c
            \ | nnoremap <leader>C [c
            \ | endif

" Re-execute last :command
nnoremap <leader>: @:

" Open search results in quickfix window
nnoremap <leader>n :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Indent/dedent what you just pasted
nnoremap <leader>< V`]<
nnoremap <leader>> V`]>

" Buffer stuff | <leader>b "{{{
nnoremap <leader>b, :bufdo
nnoremap <leader>bN :bNext<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bu :bunload<CR>
"}}}
" Fold stuff | <leader>f "{{{
nnoremap <leader>ff :set fdm=manual<CR>
nnoremap <leader>fi :set fdm=indent<CR>
nnoremap <leader>fm :set fdm=marker<CR>
nnoremap <leader>fs :set fdm=syntax<CR>
nnoremap <leader>fd :set fdm=diff<CR>
"}}}
" Git stuff | <leader>g "{{{
" No mappings for it here because they're all with the fugitive plugin
"}}}
" Mark stuff | <leader>m "{{{
nnoremap <leader>m `
nnoremap <leader>M :marks<CR>
"}}}
" Toggle settings | <leader>o "{{{
let settings = {
            \ 'c': 'cursorline',
            \ 'h': 'hlsearch',
            \ 'n': 'number',
            \ 'r': 'relativenumber',
            \ 's': 'spell',
            \ 'u': 'cursorcolumn',
            \ 'w': 'wrap',
            \ }

for [key, val] in items(settings)
    exec printf("nnoremap <silent> <leader>o%s :<C-U>set inv%s<CR>", key, val)
endfor
" }}}
" Tab stuff | <leader>t {{{
" Move through tabs
nnoremap <leader>t, :tabdo
nnoremap <leader>tN :tabN<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tf :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
" Move tabs (tm moves current tab to the right, tM to the left)
nnoremap <leader>tm :tabm +<CR>
nnoremap <leader>tM :tabm -<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tt :tabnew<CR>
" }}}
" Window stuff | <leader>w "{{{
nnoremap <leader>w, :windo

" Minimize window height
nnoremap <leader>wm :res1<CR>
" Maximize window height
nnoremap <leader>wM :res200<CR>
" Minimize  window width
nnoremap <leader>wvm :vertical res2<CR>
" Maximize window width
nnoremap <leader>wvM :vertical res200<CR>

" Decrease window height by 5
nnoremap <leader>wr :res -5<CR>
" Increase window height by 5
nnoremap <leader>wR :res +5<CR>
" Decrease window width by 5
nnoremap <leader>wvr :vertical res -5<CR>
" Increase window width by 5
nnoremap <leader>wvR :vertical res +5<CR>
"}}}
"==============================================================================}}}
" Normal Mode Mappings ========================================================{{{
"==============================================================================
" Re-sources .vimrc
nnoremap <silent><F5> <ESC>:source $MYVIMRC<CR>

" Redraw and reset syntax highlighting (if things look weird, press this)
nnoremap <silent><F6> <ESC>:execute 'colo' colors_name<cr>:syntax sync fromstart<cr>

" Easier Split Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Next two enable faster scrolling with <C-e> and <C-y>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Use very magic for searching
nnoremap / /\v
vnoremap / /\v

" Jump to start and end of line using homerow keys
nnoremap H ^
nnoremap L $

" Makes 'Enter' insert a <CR> it's like the opposite of J
nnoremap <C-m> i<C-m><Esc>

" Execute most recently executed macro
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

" Unimpaired mappings (Strongly inspired by tpope, some of this is borrowed) {{{
" Navigate files {{{
" Move to begining/end of fold region
nnoremap [f [z
nnoremap ]f ]z
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
" }}}
"==============================================================================}}}
" Insert Mode Mappings ========================================================{{{
"==============================================================================

" A quicker alternative to pushing <ESC>
inoremap jk <ESC> `^
inoremap kj <ESC> `^
" My dvorak equivilent
inoremap hh <ESC> `^

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

" Uppercase current word
inoremap <c-u> <esc>mzgUiw`za

" Insert line above cursor and move cursor to that line at correct indent
inoremap <silent><C-o> <esc>O

"==============================================================================}}}
" Command Mode Mappings ======================================================={{{
"==============================================================================
" Escape spaces in command-mode by pressing space twice
cnoremap <Space><Space> \<Space>

" Exit Insert-mode by pressing j+k together (order doesn't matter)
cnoremap hh <ESC> `^
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

" Make vp not replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()
vnoremap <silent> <expr> P <sid>Repl()
"==============================================================================}}}
" Misc ========================================================================{{{
"==============================================================================
" unmap <Tab>

"==============================================================================}}}
