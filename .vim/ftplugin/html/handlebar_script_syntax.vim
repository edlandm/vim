syntax include @HB syntax/handlebars.vim
syntax region csSnip matchgroup=Snip start="<script (.*)?type=\"text\/x-handlebars-template>" end="</script>" contains=@HB
hi link Snip SpecialComment
