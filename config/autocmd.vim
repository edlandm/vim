" vim:fdm=marker
"=============================Autocommand Settings=============================
" Source directory-local vimrc
autocmd VimEnter * if filereadable("./.local.vimrc") == 1
            \ | source ./.local.vimrc
            \ | endif

" Source file-specific vimrcs
autocmd BufReadPost * if filereadable(expand("%") . ".vimrc") == 1
            \ | execute "source " . expand("%") . ".vimrc"
            \ | endif

" wsgi files are python
autocmd BufNewFile,BufRead *.wsgi set filetype=python

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \ | exe "normal! g`\""
            \ | endif

" if cursor is in a closed fold, open it (even if multiple levels deep)
autocmd BufWinEnter * while foldclosed(line('.')) != -1
            \ | exe "foldopen"
            \ | endwhile

" Turns autocompletion on for various filetypes
augroup omnifuncs "{{{
    autocmd!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType aspnet set omnifunc=ccomplete#Complete
    autocmd Syntax * if &omnifunc == ""
                \ | setl omnifunc=syntaxcomplete#Complete
                \ | endif
augroup END "}}}

" Remove trailing white spaces when file is saved
autocmd BufWritePre :%s/\s\+$//

" Source file-specific vimrcs
autocmd BufReadPost * if filereadable(expand("%") . ".vimrc") == 1
            \ | execute "source " . expand("%") . ".vimrc"
            \ | endif

" Re-source .vimrc everytime it's modified
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost *.vimrc execute 'source ' . expand("%")
                \ | redraw!
augroup END

" Remove trailing white spaces on write
autocmd BufWritePre * :%s/\s\+$//e

" show listchars when not in insert mode
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Spellcheck Commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!
