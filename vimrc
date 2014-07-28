" vim:fdm=marker
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if has('vim_starting')
    set nocompatible
    set runtimepath +=~/.vim/bundle/neobundle.vim/
else
    call neobundle#call_hook('on_source')
endif

" Start NeoBundle
call neobundle#begin(expand('~/.vim/bundle')) "--------------------------------

" Use git protocol
let g:neobundle#types#git#default_protocol = 'git'

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

let overridden = [
            \ 'tpope/vim-fugitive',
            \ 'shougo/vimproc.vim'
            \ ]

NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }
NeoBundle 'Shougo/vimproc.vim', { 'build': {'unix': 'make'}}

" Load all plugins that don't require special settings
let bundle_list=expand('$HOME/.vim/bundle_list.txt')
if filereadable(bundle_list)
for bundle in readfile(bundle_list)
    if index(overridden, tolower(bundle)) == -1
        execute "NeoBundle '" . bundle . "'"
    endif
endfor
endif

call neobundle#end() "---------------------------------------------------------

" Enable file type detection.
filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
    syntax enable
endif

" Highlight trailing white spaces
match ErrorMsg '\s\+$'

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Fix tmux background issue
set t_ut=

" Generate help pages
execute pathogen#helptags()

" If there are uninstalled bundles found on startup, this will prompt to install
NeoBundleCheck

" Split up config settings into multiple files (modularization ftw!)
runtime! config/*.vim

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ 'xterm-256color'
    set t_ut=
endif
