" Colorscheme

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"colorscheme solarized
colorscheme gruvbox

highlight ColorColumn term=bold ctermbg=236

"Touch wsqi.py after saving python files in housing
if match(current_dir, 'wwu_housing\/') >= 0
    autocmd BufWritePre *.py ! touch /home/edlandm/django/wwu_housing/wsgi.py
endif
