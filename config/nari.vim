highlight ColorColumn term=bold ctermbg=0

set background=dark
colorscheme lucius

" Touch wsgi.py for the django apps to reload the server
nnoremap <leader>uw :!touch ~/django/wwu_housing/wsgi.py<cr><cr>
