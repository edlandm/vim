function RunCommandPrompt(...)
    let argstr = join(a:000, ' ')
    call VimuxRunCommand(argstr)
endfunction
command! -nargs=+ RunCommand call RunCommandPrompt(<f-args>)
nnoremap <leader>: :RunCommand<space>

nnoremap <leader>. :VimuxRunLastCommand<CR>
