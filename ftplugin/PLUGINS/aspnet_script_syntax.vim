syntax include @CS syntax/cs.vim
syntax region csSnip matchgroup=Snip start="<script runat=\"server\">" end="</script>" contains=@CS
hi link Snip SpecialComment
