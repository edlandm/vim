set fdm=indent

" Mappings
" Wrap line in console.log();
nnoremap <leader>,c Iconsole.log(<esc>A);<esc>
" Turns this: myvariable
" into this:  console.log('myvariable:', myvariable);
" NOTE: it's important that this be nmap because I recorded this from a macro
"       and use some of my other bindings
nmap <leader>,C Hy$i':', ");console.log(hh
" Add semicolon to the end of the line
nnoremap <leader>; A;<esc>
" Add comma to the end of the line
nnoremap <leader>,, A,<esc>

inoremap ;; <esc>A;
inoremap ,, <esc>A,
