" Load .vimrc first and then override anything that conflicts
exec ":source " . $HOME . "/.vimrc"

" My cursor, don't you ever touch it
set guicursor=a:block-Cursor
set guicursor+=a:blinkon0

" GUI Fontlist
set guifont=Anonymous\ Pro\ for\ Powerline:h12,
            \Anonymice\ Powerline:h12,
            \Andale\ Mono:h12,
            \Courier\ New:h12,
            \Courier:h12

" guioptions
 set guioptions=g

augroup MacMeta
    "While in insert mode, the alt-key can be used for unicode characters.
    "Otherwise, it is a meta-key and can be mapped with <M-char>
    autocmd!
    autocmd InsertEnter * set nomacmeta
    autocmd InsertLeave * set macmeta
augroup END

" Enable MultiCursor default key mappings
if exists('g:multi_cursor_default_mapping')
    let g:multi_cursor_default_mapping=1
endif
