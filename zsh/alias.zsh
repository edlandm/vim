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
# Edit .zshrc
alias zrc='vim ~/.zshrc'
#
# Re-Source .zshrc
alias zrcr='source ~/.zshrc'
#
# Restart Apache
alias sag='sudo apachectl graceful'
#
# Executes python file (with python)
alias p]='python'
#
# More dots
alias -g ..='cd ../'
alias -g ...='cd ../../'
alias -g ....='cd ../../../'
#
#* ** ls aliases ** *#
# ls vertically
alias -g lsv='ls -1'
# ls long format
alias -g lsl='ls -lh'
# list all files
alias -g lsa='ls -a'
alias -g lsla='ls -lha' # l for long format
alias -g lsva='ls -1a' # v for vertical
# list hidden files
alias -g lsh='ls -d .*'
alias -g lslh='ls -lhd .*' # l for long format
alias -g lsvh='ls -1d .*' # v for vertical
# list directories
alias -g lsd='ls -d *(N/)'
alias -g lsld='ls -lhd *(N/)' # l for long format
alias -g lsvd='ls -1d *(N/)' # v for vertical
# list hidden directories
alias -g lshd='ls -d .*(N/)'
alias -g lslhd='ls -lhd .*(N/)' # l for long format
alias -g lsvhd='ls -1d .*(N/)' # v for vertical
# list all directories
alias -g lsad='ls -d *(ND/)'
alias -g lslad='ls -lhd *(ND/)' # l for long format
alias -g lsvad='ls -1d *(ND/)' # v for vertical
# list empty directories
alias -g lsed='ls -d *(N/^F)'
alias -g lsled='ls -d *(N/^F)' # l for long format
alias -g lsved='ls -d *(N/^F)' # v for vertical
# list hidden empty directories
alias -g lshed='ls -d .*(N/^F)'
alias -g lslhed='ls -d .*(N/^F)' # l for long format
alias -g lsvhed='ls -d .*(N/^F)' # v for vertical
# list all empty directories
alias -g lsaed='ls -d *(ND/^F)'
alias -g lslaed='ls -d *(ND/^F)' # l for long format
alias -g lsvaed='ls -d *(ND/^F)' # v for vertical
# list recursively empty directories
alias -g lsred='ls -d **/*(N/^F)'
alias -g lslred='ls -d **/*(N/^F)' # l for long format
alias -g lsvred='ls -d **/*(N/^F)' # v for vertical
# list recursively hidden empty directories
alias -g lshred='ls -d .**/*(N/^F)'
alias -g lslhred='ls -d .**/*(N/^F)' # l for long format
alias -g lsvhred='ls -d .**/*(N/^F)' # v for vertical
# list recursively all empty directories
alias -g lsared='ls -d **/*(ND/^F)'
alias -g lslared='ls -d **/*(ND/^F)' # l for long format
alias -g lsvared='ls -d **/*(ND/^F)' # v for vertical
# list SymLinks
alias -g lssl='ls -d *(N@)'
alias -g lslsl='ls -lhd *(N@)' # l for long format
alias -g lsvsl='ls -1d *(N@)' # v for vertical
# list hidden SymLinks
alias -g lshsl='ls -d .*(N@)'
alias -g lhslsl='ls -lhd .*(N@)' # l for long format
alias -g lsvhsl='ls -1d .*(N@)' # v for vertical
# list all SymLinks
alias -g lsasl='ls -d *(ND@)'
alias -g laslsl='ls -lhd *(ND@)' # l for long format
alias -g lsvasl='ls -1d *(ND@)' # v for vertical
# ** du aliases **#
# show sorted directory sizes for directories
alias dus='du -s *(/) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done' # s for 'sort'
# show sorted directory sizes for hidden directories
alias dush='du -s .*(/) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done' # s for 'sort'
# show sorted directory sizes for all directories
alias dusa='du -s *(D/) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done' # s for 'sort'
#
# slightly more readable df
alias df='df -h'
# grep and keep colors
alias cgrep='grep --color=auto'
# quit and write quite
alias :q='exit'
alias :wq='exit'
#
# Makes zmv so that it can be used as such: `mmv *.jpeg *.jpg
alias mmv='noglob zmv -W'
# Counts lines
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
