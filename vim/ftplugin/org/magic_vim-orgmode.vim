au BufEnter *.org setlocal shiftwidth=2
            \ | setlocal tabstop=2
" todo options
let g:org_todo_keywords=[['OPEN', 'FEEDBACK', '|', 'RESOLVED', 'CLOSED'],
            \ ['TODO', '|', 'DONE']
            \ ]

" For some reasons the default mappings aren't being set, so I'm setting them
" here
" Checkbox mappings
nnoremap <localleader>cc :OrgCheckBoxToggle<cr>
nnoremap <localleader>c# :OrgCheckBoxUpdate<cr>
nnoremap <localleader>cn :OrgCheckBoxNewBelow<cr>
nnoremap <localleader>cN :OrgCheckBoxNewAbove<cr>

" Export mappings
nnoremap <localleader>ep :OrgExportToPDF<cr>
nnoremap <localleader>eh :OrgExportToHTML<cr>
nnoremap <localleader>el :OrgExportToLaTeX<cr>

" Narrow buffer to turrent
nmap <localleader>nr vOr:NarrowRegion<cr>

" TODO mappings
nnoremap <localleader>ct

" Set tags
nnoremap <localleader>t :OrgSetTags<cr>
