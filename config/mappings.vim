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
vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>

" Save the file
nnoremap <leader>w :w<cr>
" Quit the file
nnoremap <leader>q :q<cr>
" Help! 'I need somebody...'
nnoremap <leader>h :h<space>

" Make all windows equal size
nnoremap <leader>= <C-w>=
" Split window horizontally
nnoremap <leader>- :sp<cr>
" Split window vertically
nnoremap <leader>\| :vsp<cr>

" Toggle paste mode
nnoremap <leader>p :set paste!<cr>

" Pulse current line
nnoremap <leader><leader> :Pulse<cr>

" toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins(direction) "{{{
    if exists('g:windowMax')
        try
            au! maxCurrWinHor
        catch
        endtry
        try
            au! maxCurrWinVer
        catch
        endtry
        try
            au! maxCurrWinAll
        catch
        endtry
        if exists('g:zoomDirection')
            if a:direction == g:zoomDirection
                unlet g:windowMax
                unlet g:zoomDirection
                wincmd =
                echo "Unzoom"
                return
            endif
        endif
    endif
    if a:direction == 'vertical'
        wincmd =
        augroup maxCurrWinVer
            au!
            au! WinEnter * wincmd _
        augroup END
        do maxCurrWinVer WinEnter
        let g:zoomDirection = 'vertical'
        echo 'Zoom Vertical'
    elseif a:direction == 'horizontal'
        augroup maxCurrWinHor
            au!
            au! WinEnter * wincmd |
        augroup END
        do maxCurrWinHor WinEnter
        let g:zoomDirection = 'horizontal'
        echo 'Zoom Horizontal'
    elseif a:direction == 'all'
        augroup maxCurrWinAll
            au!
            au! WinEnter * wincmd _ | wincmd |
        augroup END
        do maxCurrWinAll WinEnter
        let g:zoomDirection = 'all'
        echo "Zoom"
    else
        wincmd =
        try
            unlet g:zoomDirection
        catch
        endtry
        echo "Unzoom"
    endif
    let g:windowMax=1
endfunction "}}}
nnoremap <leader>zz :call ToggleMaxWins('vertical')<cr>
nnoremap <leader>zZ :call ToggleMaxWins('horizontal')<cr>
nnoremap <leader>z<space> :call ToggleMaxWins('all')<cr>
nnoremap <leader>Z :call ToggleMaxWins('none')<cr>

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
nnoremap <leader>bN :bNext<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bu :bunload<cr>
"}}}
" Fold stuff | <leader>f "{{{
nnoremap <leader>ff :set fdm=manual<cr>
nnoremap <leader>fi :set fdm=indent<cr>
nnoremap <leader>fm :set fdm=marker<cr>
nnoremap <leader>fs :set fdm=syntax<cr>
nnoremap <leader>fd :set fdm=diff<cr>
"}}}
" Git stuff | <leader>g "{{{
" No mappings for it here because they're all with the fugitive plugin
"}}}
" Mark stuff | <leader>m "{{{
nnoremap <leader>m `
nnoremap <leader>M :marks<cr>
"}}}
" Toggle settings | <leader>o "{{{
let settings = {
        \ 'cc': 'cursorcolumn',
        \ 'cl': 'cursorline',
        \ 'h': 'hlsearch',
        \ 'n': 'number',
        \ 'r': 'relativenumber',
        \ 's': 'spell',
        \ 'w': 'wrap',
        \ }

for [key, val] in items(settings)
    exec printf("nnoremap <silent> <leader>o%s :<C-U>set inv%s<cr>", key, val)
endfor

nnoremap <leader>lf :set spelllang=fr
nnoremap <leader>lu :set spelllang=us
" }}}
" Tab stuff | <leader>t {{{
" Move through tabs
nnoremap <leader>t, :tabdo
nnoremap <leader>tN :tabN<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tf :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>
" Move tabs (tm moves current tab to the right, tM to the left)
nnoremap <leader>tm :tabm +<cr>
nnoremap <leader>tM :tabm -<cr>
nnoremap <leader>tn :tabn<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tt :tabnew<cr>
" }}}
" Window stuff | <leader>w "{{{
nnoremap <leader>w, :windo

" Minimize window height
nnoremap <leader>wm :res1<cr>
" Maximize window height
nnoremap <leader>wM :res200<cr>
" Minimize  window width
nnoremap <leader>wvm :vertical res2<cr>
" Maximize window width
nnoremap <leader>wvM :vertical res200<cr>

" Decrease window height by 5
nnoremap <leader>wr :res -5<cr>
" Increase window height by 5
nnoremap <leader>wR :res +5<cr>
" Decrease window width by 5
nnoremap <leader>wvr :vertical res -5<cr>
" Increase window width by 5
nnoremap <leader>wvR :vertical res +5<cr>
"}}}
"==============================================================================}}}
" Normal Mode Mappings ========================================================{{{
"==============================================================================
" Re-sources .vimrc
nnoremap <silent><F5> <ESC>:source $MYVIMRC<cr>

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

" Makes 'Enter' insert a <cr> it's like the opposite of J
nnoremap <C-m> i<C-m><Esc>

" Execute most recently executed macro
nnoremap Q @q

" Maps ' to ` so that it jumps to line AND column of mark. It's just easier to
" than hitting ` (it also eliminates the need to excape it from tmux)
nnoremap ' `
" Also in operator-pending mode
onoremap ' `

" Y yanks to end of line, making it consistant with D and C
nnoremap Y y$

" Remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Select last pasted text
nnoremap gV `[v`]

" "Focus" the current line.  Basically:
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.
"
" This mapping wipes out the z mark, which I never use.
nnoremap z<leader> mzzMzvzazAzz15<c-e>`z:Pulse<cr>

" Search mappings {{{
" Motion commands AND search? No way!
" For example: sib
" will select inside the surrounding parentheses and open up the search
" prompt. Just type your search and press <cr> and it will only search in that
" range
" And: ssib
" will do the same except for search and replace
for k in ['b', 'B', 't', '[', ']', '<', '>']
    " Holy string concatination Batman!
    execute 'nnoremap si'  . k . ' vi' . k .
                \ ':<c-u>execute "/\\%>" . (line("' . "'" . '<") - 1) . "l\\%<" . (line("' . "'" .'>") + 1) . "l"<left>'
    execute 'nnoremap sa'  . k . ' va' . k .
                \ ':<c-u>execute "/\\%>" . (line("' . "'" . '<") - 1) . "l\\%<" . (line("' . "'" .'>") + 1) . "l"<left>'
    execute 'nnoremap ssi' . k . ' vi' . k . ':s/'
    execute 'nnoremap ssa' . k . ' va' . k . ':s/'
endfor
" Search within visually-selected range
vnoremap s :<c-u>execute "/\\%>" . (line("'<") - 1) . "l\\%<" . (line("'>") + 1) . "l"<left>
" Search and replace within visually-selected range
vnoremap S :s/
" }}}

" File explorer mappings {{{
" I have good ideas for this. I'd like a single-key-to-select mode in the
" netrw window. I just don't know how to impliment that...
function! ToggleExplorer(pattern) "{{{
    if &ft == "netrw"
        Rexplore
    else
        if a:pattern != ''
            Explore a:pattern
        else
            Explore
        endif
    endif
endfunction "}}}
nnoremap <tab><tab> :call ToggleExplorer('')<cr>
" This can only really be used when you're not in a netrw window
nnoremap <tab><leader><tab> :call ToggleExplorer('')<cr>

nnoremap <tab>s :Hexplore<cr>
nnoremap <tab><leader>s :Hexplore<space>
nnoremap <tab>- :Hexplore<cr>
nnoremap <tab><leader>- :Hexplore<space>

nnoremap <tab>S :Vexplore<cr>
nnoremap <tab><leader>S :Vexplore<space>

nnoremap <tab>t :Texplore<cr>
nnoremap <tab><leader>t :Texplore<space>

nnoremap <tab>n :Nexplore<cr>
nnoremap <tab>N :Nexplore!<cr>
nnoremap <tab>p :Pexplore<cr>
nnoremap <tab>P :Pexplore!<cr>
" }}}

" Unimpaired mappings (Strongly inspired by tpope or just flat up stolen) {{{
" Navigate between files {{{
" Navigate buffers
nnoremap [b :bprev
nnoremap ]b :bnext
" Navigate through argument list
nnoremap [a :next
nnoremap ]a :prev
" }}}
" Navigate within a file {{{
" Move to begining/end of fold region
nnoremap [f [z
nnoremap ]f ]z
" Navigate quickfix/location lists
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>
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
nnoremap <silent> [e :<C-U>call Move('--',v:count1,'Up')<cr>
" Exchange current line with [count] lines below it
nnoremap <silent> ]e :<C-U>call Move('+',v:count1,'Down')<cr>
" Exchange current selection with [count] lines above it
vnoremap <silent> [e :<C-U>call MoveSelectionUp(v:count1)<cr>gv
" Exchange current selection with [count] lines below it
vnoremap <silent> ]e :<C-U>call MoveSelectionDown(v:count1)<cr>gv
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
inoremap jk <esc> `^
inoremap kj <esc> `^
" My dvorak equivilent
inoremap hh <esc> `^

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Next two set indenting in insert-mode
inoremap << <C-d>
inoremap >> <C-t>

" Go to beginning of line in insert mode
inoremap <C-a> <esc>I

" Go to end of line in insert mode
inoremap <C-e> <esc>A

" Move current line up one line (switches places with above line)
inoremap <silent><C-k> <esc>mz:m-2<cr>`zi

" Move current line down one line (switches places with below line)
inoremap <silent><C-j> <esc>mz:m+<cr>`zi

" Uppercase current word
inoremap ,cU <esc>mzgUiw`za
" Lowercase current word
inoremap ,cu <esc>mzguiw`za
" Uppercase current line
inoremap ,CU <esc>mzgUU`za
" Lowercase current line
inoremap ,Cu <esc>mzguu`za

" Insert line above cursor and move cursor to that line at correct indent
inoremap <silent><c-o> <esc>O

" Move to the end of the next line
inoremap <silent><c-l> <esc>jA

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

vnoremap <C-n> y/<C-R>"<cr>

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
