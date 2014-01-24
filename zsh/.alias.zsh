#** ** ** * ** ** **#
#* ** *Aliases* ** *#
#** ** ** * ** ** **#
#
#***ResTek ssh aliases***
alias sdev='ssh edlandm@dev.housing.wwu.edu'
alias sgravel='ssh edlandm@gravelpit.housing.wwu.edu'
alias snari='ssh edlandm@nari.housing.wwu.edu'
alias sjuice='ssh edlandm@juicebox.restek.wwu.edu'
#
#Edit .zshrc
alias zrc='vim ~/.zshrc'
#
#Re-Source .zshrc
alias zrcr='source ~/.zshrc'
#
#Restart Apache
alias sag='sudo apachectl graceful'
#
#Executes python file (with python)
alias p]='python'
#
#More dots
alias -g ..='cd ../'
alias -g ...='cd ../../'
alias -g ....='cd ../../../'
#
#List directories and then files
alias -g lsa='{ ls -dl *(N,/,@);ls -l *(N,.) }'
#List directories
alias -g lsd='ls -dl *(N,/,@)'
#List hidden,nonhidden directories and then same for files
alias -g lss='{ ls -dl .*(N,/,@);ls -dl *(N,/,@);ls -l .*(N,.);ls -l *(N,.) }'
#
#Counts lines
alias wcl='wc -l'
#* ** Suffixes ** *#
#
alias -s py="python"
alias -s txt="vim"
alias -s css="vim"
alias -s aspx="vim"
alias -s asmx="vim"
alias -s convig="vim"
alias -s master="vim"
