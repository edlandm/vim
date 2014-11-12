" vim:fdm=marker
"===================================== Settings ================================
" Important ===================================================================={{{
" compatible   behave very Vi compatible (not advisable)
    set nocp
" cpoptions   list of flags to specify Vi compatibility
    set cpo=aABceFs
" pastetoggle   key sequence to toggle paste mode
    set pt=<F8>
"===============================================================================
"===============================================================================}}}
" Moving around, searching, and patterns ======================================={{{
"===============================================================================
" startofline   many jump commands move the cursor to the first non-blank
" character of a line
    set sol
" path   list of directory names used for file searching
" (global or local to buffer)
    set pa=$HOME,.
" cdpath    list of directory names used for :cd
    set cd=$HOME,.,./*
" autochdir   change to directory of file in buffer
    set noacd
" wrapscan  search commands wrap around the end of the buffer
    set ws
" incsearch   show match for partly typed search command
    set is
" magic   change the way backslashes are used in search patterns
    set magic
" ignorecase    ignore case when using a search pattern
    set ic
" smartcase   override 'ignorecase' when pattern has upper case characters
    set scs
" casemap   what method to use for changing case of letters
    set cmp=internal,keepascii
" maxmempattern   maximum amount of memory in Kbyte used for pattern matching
    set mmp=1000
"===============================================================================}}}
" Tags ========================================================================={{{
"===============================================================================
" tagbsearch   use binary searching in tags files
    set tbs
" taglength   number of significant characters in a tag name or zero
    set tl=0
" tags   list of file names to search for tags
" (global or local to buffer)
    set tag=./tags,tags,./.tags
" tagrelative   file names in a tags file are relative to the tags file
    set tr
" tagstack   a :tag command will use the tagstack
    set tgst
" showfulltag   when completing tags in Insert mode show more info
    set sft
" cscopeverbose   give messages when adding a cscope database
    set nocsverb
" cscopepathcomp   how many components of the path to show
    set cspc=0
" cscopequickfix   when to open a quickfix window for cscope
    set csqf=
" cscoperelative   file names in a cscope file are relative to that file
    set nocsre
"===============================================================================}}}
" Displaying text =============================================================={{{
"===============================================================================
" scroll   number of lines to scroll for CTRL-U and CTRL-D
" (local to window)
    set scr=15
" scrolloff   number of screen lines to show around the cursor
    set so=3
" wrap   long lines wrap
    set wrap
" breakat   which characters might cause a line break
    set brk="\ ^I!@*-+;:,./?"
" showbreak   string to put before wrapped screen lines
    set sbr=
" sidescroll   minimal number of columns to scroll horizontally
    set ss=0
" sidescrolloff   minimal number of columns to keep left and right of the cursor
    set siso=0
" display   include "lastline" to show the last line even if it doesn't fit
" include "uhex" to show unprintable characters as a hex number
    set dy=lastline,uhex
" fillchars   characters to use for the status line, folds and filler lines
    set fcs=vert:\|,fold:-
" cmdheight   number of lines used for the command-line
    set ch=1
" lazyredraw   don't redraw while executing macros
    set lz
" redrawtime   timeout for 'hlsearch' and :match highlighting in msec
    set rdt=2000
" number   show the line number for each line
" (local to window)
    set nu
" numberwidth   number of columns to use for the line number
" (local to window)
    set nuw=4
" conceallevel   controls whether concealable text is hidden
" (local to window)
    set cole=2
" concealcursor   modes in which text in the cursor line can be concealed
" (local to window)
    set cocu=inc
" Show trailing whitespace as dots
exec "set listchars=tab:>~,trail:\uB7"
set list

"===============================================================================}}}
" Syntax, highlighting and spelling ============================================{{{
"===============================================================================
" synmaxcol   maximum column to look for syntax items
" (local to buffer)
    set smc=500
" hlsearch   highlight all matches for the last used search pattern
    set nohls
" cursorcolumn   highlight the screen column of the cursor
" (local to window)
    set nocuc
" cursorline   highlight the screen line of the cursor
" (local to window)
    set cul
" colorcolumn   columns to highlight
" (local to window)
    " execute "set colorcolumn=".join(range(81,200), ",")
    " set colorcolumn=80
    " Only show the colorcolumn where text is overflowing
    call matchadd('ColorColumn', '\%80v', 100)
" spellsuggest   methods used to suggest corrections
    set sps=best
" mkspellmem   amount of memory used by :mkspell before compressing
    set msm=460000,2000,500
"===============================================================================}}}
" Multiple Windows ============================================================={{{
"===============================================================================
" laststatus   0, 1 or 2; when to use a status line for the last window
    set ls=2
" equalalways   make all windows the same size when adding/removing windows
    set noea
" eadirection   in which direction 'equalalways' works: "ver", "hor" or "both"
    set ead=both
" winminheight   minimal number of lines used for any window
    set wmh=1
" winminwidth   minimal number of columns used for any window
    set wmw=1
" helpheight   initial height of the help window
    set hh=20
" previewheight   default height for the preview window
    set pvh=12
" hidden   don't unload a buffer when no longer shown in a window
    set hid
" switchbuf   "useopen" and/or "split"; which window to use when jumping
" to a buffer
    set swb=useopen
" splitbelow   a new window is put below the current one
    set sb
" splitright   a new window is put right of the current one
    set spr
"===============================================================================}}}
" Multiple tab pages ==========================================================={{{
"===============================================================================
" showtabline  0, 1 or 2; when to use a tab pages line
   set stal=2
" tabpagemax  maximum number of tab pages to open for -p and "tab all"
   set tpm=5
"===============================================================================}}}
" Terminal ====================================================================={{{
"===============================================================================
" term  name of the used terminal
   set term=xterm-256color
" ttytype  alias for 'term'
   set tty=xterm-256color
" ttybuiltin  check built-in termcaps first
   set tbi
" ttyfast  terminal connection is fast
   set tf
" esckeys  recognize keys that start with <Esc> in Insert mode
   set ek
" title  show info in the window title
   set title
" titlestring  when not empty, string to be used for the window title
   set titlestring=
" titleold  string to restore the title to when exiting Vim
   set titleold=Keep\ Calm\ and\ hjkl
" icon  set the text of the icon for this window
   set noicon
"===============================================================================}}}
" Using the mouse =============================================================={{{
"===============================================================================
" Don't use the mouse, you're better than that
   set mouse=
"===============================================================================}}}
" Printing ====================================================================={{{
"===============================================================================
" printoptions  list of items that control the format of :hardcopy output
   set popt=
" printdevice  name of the printer to be used for :hardcopy
   set pdev=
" printfont  name of the font to be used for :hardcopy
   set pfn=courier
" printheader  format of the header used for :hardcopy
   set pheader=%<%f%h%m%=Page\ %N
" printencoding  encoding used to print the PostScript file for :hardcopy
   set penc=utf-8
" printmbcharset  the CJK character set to be used for CJK output from :hardcopy
   set pmbcs=
" printmbfont  list of font names to be used for CJK output from :hardcopy
   set pmbfn=
"===============================================================================}}}
" Messages and info ============================================================{{{
"===============================================================================
" terse  add 's' flag in 'shortmess' (don't show search message)
   set noterse
" showcmd  show (partial) command keys in the status line
   set sc
" showmode  display the current mode in the status line
   set smd
" ruler  show cursor position below each window
   set ru
" report  threshold for reporting number of changed lines
   set report=2
" verbose  the higher the more messages are given
   set vbs=0
" more  pause listings when the screen is full
   set more
" confirm  start a dialog when a command fails
   set nocf
" errorbells  ring the bell for error messages
   set noeb
" visualbell  use a visual bell instead of beeping
   set novb
" helplang  list of preferred languages for finding help
   set hlg=en
"===============================================================================}}}
" Selecting text ==============================================================={{{
"===============================================================================
" selection  "old", "inclusive" or "exclusive"; how selecting text behaves
   set sel=inclusive
" clipboard  "unnamed" to use the * register like unnamed register
" autoselect" to always put selected text on the clipboard
   set cb="unnamed"
"===============================================================================}}}
" Editing text ================================================================={{{
"===============================================================================
" undolevels  maximum number of changes that can be undone
   set ul=1000
" undoreload  maximum number lines to save for undo on a buffer reload
   set ur=10000
" textwidth  line length above which to break a line
"(local to buffer)
   set tw=78
" wrapmargin  margin from the right in which to break a line
"(local to buffer)
   set wm=0
" backspace  specifies what <BS>, CTRL-W, etc. can do in Insert mode
   set bs=indent,eol,start
" complete  specifies how Insert mode completion works for CTRL-N and CTRL-P
"(local to buffer)
   set cpt=.,w,b,u,t,i
" completeopt  whether to use a popup menu for Insert mode completion
   set cot=menu,preview
" pumheight  maximum height of the popup menu
   set ph=15
" infercase  adjust case of a keyword completion match
"(local to buffer)
   set noinf
" tildeop  the "~" command behaves like an operator
   set notop
" showmatch  when inserting a bracket, briefly jump to its match
   set nosm
" matchtime  tenth of a second to show a match for 'showmatch'
   set mat=5
" joinspaces  use two spaces after '.' when joining a line
   set js
" nrformats  "alpha", "octal" and/or "hex"; number formats recognized for
" CTRL-A and CTRL-X commands
"(local to buffer)
   set nf=hex
"===============================================================================}}}
" Tabs and indenting ==========================================================={{{
"===============================================================================
" tabstop  number of spaces a <Tab> in the text stands for
"(local to buffer)
   set ts=4
" shiftwidth  number of spaces used for each step of (auto)indent
"(local to buffer)
   set sw=4
" smarttab  a <Tab> in an indent inserts 'shiftwidth' spaces
   set sta
" softtabstop  if non-zero, number of spaces to insert for a <Tab>
"(local to buffer)
   set sts=0
" shiftround  round to 'shiftwidth' for "<<" and ">>"
   set sr
" expandtab  expand <Tab> to spaces in Insert mode
"(local to buffer)
   set et
" autoindent  automatically set the indent of a new line
"(local to buffer)
   set ai
" smartindent  do clever autoindenting
"(local to buffer)
   set nosi
" cindent  enable specific indenting for C code
"(local to buffer)
   set cin
" copyindent  copy whitespace for indenting from previous line
"(local to buffer)
   set noci
" preserveindent  preserve kind of whitespace when changing indent
"(local to buffer)
   set nopi
"===============================================================================}}}
" Folding ======================================================================{{{
"===============================================================================
" foldenable  set to display all folds open
"(local to window)
   set fen
" foldclose  set to "all" to close a fold when the cursor leaves it
   set fcl=
" foldopen  specifies for which commands a fold will be opened
   set fdo=block,insert,percent,quickfix,search,tag,undo
" foldmethod  folding type: "manual", "indent", "expr", "marker" or "syntax"
"(local to window)
   set fdm=manual
" foldignore  used to ignore lines when 'foldmethod' is "indent"
"(local to window)
   set fdi=
" foldmarker  markers used when 'foldmethod' is "marker"
"(local to window)
   set fmr={{{,}}}
"===============================================================================}}}
" Diff mode ===================================================================={{{
" diffopt  options for using diff mode
   set dip=filler,vertical
"===============================================================================
"===============================================================================}}}
" Mapping ======================================================================{{{
"===============================================================================
" maxmapdepth  maximum depth of mapping
   set mmd=20
" remap  recognize mappings in mapped keys
   set remap
" timeout  allow timing out halfway into a mapping
   set to
" ttimeout  allow timing out halfway into a key code
   set nottimeout
" timeoutlen  time in msec for 'timeout'
   set tm=450
" ttimeoutlen  time in msec for 'ttimeout'
   set ttm=-1
"===============================================================================}}}
" Reading and writing files ===================================================={{{
"===============================================================================
" modeline  enable using settings from modelines when reading a file
"(local to buffer)
   set ml
" modelines  number of lines to check for modelines
   set mls=5
" fileformats  list of file formats to look for when editing a file
   set ffs=unix,dos
" backup  keep a backup after overwriting a file
   set nobk
   set nowb
" backupdir  list of directories to put backup files in
   " set bdir=.,/Users/miles/tmp,/Users/miles/
" autowrite  automatically write a file when leaving a modified buffer
   set noaw
" autowriteall  as 'autowrite', but works with more commands
   set noawa
" writeany  always write without asking for confirmation
   set nowa
" autoread  automatically read a file when it was modified outside of Vim
"(global or local to buffer)
   set ar
" fsync  forcibly sync the file to disk after writing it
   set fs
" cryptmethod  encryption method for file writing: zip or blowfish
"(local to buffer)
   set cm=zip
"===============================================================================}}}
" The swap file ================================================================{{{
" swapfile  use a swap file for this buffer
"(local to buffer)
   set noswf
"===============================================================================
"===============================================================================}}}
" Command line editing ========================================================={{{
"===============================================================================
" history  how many command lines are remembered
   set hi=1000
" wildchar  key that triggers command-line expansion
   set wc=<tab>
" wildcharm  like 'wildchar' but can also be used in a mapping
   set wcm=0
" wildmode  specifies how command line completion works
set wim=list:longest
" suffixes  list of file name extensions that have a lower priority
   set su=.bak,~,.o,.h,.info,.swp,.obj,.pyc
" wildignorecase  ignore case when completing file names
set wic
set wildignore+=.hg,.git,.svn                       " Version control
set wildignore+=*.aux,*.out,*.toc                   " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " Binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " Compiled object files
set wildignore+=#.spl                               " Compiled spelling word lists
set wildignore+=#.sw?                               " Vim swap files
set wildignore+=#.DS_Store                          " Stupid os x stuff
set wildignore+=#.pyc                               " Python byte code
" wildmenu  command-line completion shows a list of matches
   set wmnu
" cedit  key used to open the command-line window
   set cedit=
" cmdwinheight  height of the command-line window
   set cwh=7
" undofile  automatically save and restore undo history
   set udf
" undodir  list of directories for undo files
   set udir=$HOME/.vim/undofiles
"===============================================================================}}}
" Executing external commands =================================================={{{
"===============================================================================
" shell  name of the shell program used for external commands
   set sh=/bin/zsh
" shellcmdflag  argument for 'shell' to execute a command
   set shcf=-c
" shellredir  used to redirect command output to a file
   set srr=>%s\ 2>&1
" shelltemp  use a temp file for shell commands instead of using a pipe
   set nostmp
" warn  warn when using a shell command and a buffer has changes
   set warn
"===============================================================================}}}
" Running make and jumping to errors ==========================================={{{
"===============================================================================
" errorfile  name of the file that contains error messages
   set ef=errors.err
" makeprg  program used for the ":make" command
"(global or local to buffer)
   set mp=make
" shellpipe  string used to put the output of ":make" in the error file
   set sp=2>&1\|\ tee
" makeef  name of the errorfile for the 'makeprg' command
   set mef=
" grepprg  program used for the ":grep" command
"(global or local to buffer)
   set gp=grep\ -n\ $*\ /dev/null
" grepformat  list of formats for output of 'grepprg'
   set gfm=%f:%l:%m,%f:%l%m,%f\ \ %l%m
"===============================================================================}}}
" Language specific ============================================================{{{
"===============================================================================
" quoteescape  specifies escape characters in a string
"(local to buffer)
   set qe=\\
" rightleftcmd  when to edit the command-line right-to-left
"(local to window)
   set rlc=search
" keymap  name of a keyboard mappping
   set kmp=
" langmap  translate characters for Normal mode
   set lmap=
"===============================================================================}}}
" Multi-byte characters ========================================================{{{
"===============================================================================
if has("multi_byte")
" encoding  character encoding used in Vim: "latin1", "utf-8"
  "euc-jp", "big5", etc.
   set enc=utf-8
" fileencoding  character encoding for the current file
"(local to buffer)
   set fenc=utf-8
" termencoding  character encoding used by the terminal
   set tenc=utf-8
endif
" fileencodings  automatically detected character encodings
   set fencs=ucs-bom,utf-8,default,latin1
" ambiwidth  width of ambiguous width characters
   set ambw=single
"===============================================================================}}}
" Various ======================================================================{{{
"===============================================================================
" virtualedit  when to use virtual editing: "block", "insert" and/or "all"
   set ve=
" sessionoptions  list of words that specifies what to put in a session file
   set ssop=blank,buffers,curdir,folds,options,localoptions,tabpages,winsize,
" viewoptions  list of words that specifies what to save for :mkview
   set vop=folds,options,localoptions,cursor
" viewdir  directory where to store files with :mkview
   set vdir=/Users/miles/.vim/view
" viminfo  list that specifies what to write in the viminfo file
   set vi=%,'100,<50,s10,h
"===============================================================================}}}
