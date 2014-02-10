if [[ -z "$ZSH" ]]; then
    zsh
fi
#Sets terminal type
export TERM="xterm-256color"

#Bash Prompt
if (("$HOSTNAME" == "gravelpit")) || (("$HOSTNAME" == "dev")); then
    export PS1="\n[\e[0;33m\!\e[00m]\u@\e[1;32m\h\e[00m: \w\`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'\`\n\[\e[0;32m\]\$\[\e[00m\]"
else
    export PS1="\n[\e[0;33m\!\e[00m]\u@\e[1;32m\h\e[00m:\e[0;32m\w\e[00m\n\`if [[ \$UID = '0' ]]; then echo '\[\e[1;31m\]'; else echo '\[\e[1;32m\]'; fi\`\$\[\e[00m\]"
fi

shopt -s extglob #enables the not (!) command. Ex: rm !(example.txt)

#***ResTek ssh aliases***
alias sjuice='ssh edlandm@juicebox.restek.wwu.edu'
alias sgravel='ssh edlandm@gravelpit.housing.eeu.edu'


#Fix vim as crontab editor
alias crontab='VIM_CRONTAB=true crontab'

#Move all images in Downloads
alias mv-images='mv ~/Downloads/*.{jpg,jpeg,png,psd,PSD,PNG} ~/Downloads/images'

#List all files (including hidden files)
alias lsa='ls -a'

#List all directories in current directory
alias lsd='ls -lh | grep ^d'

#List list all files recursively
alias lsr='ls -R'

#Move 'up' one directory
alias ..='cd ..'

#Move 'up' two directories
alias ...='cd ../../'

#Move to Downloads Folder
alias dl='cd ~/Downloads/'

#Move to Wallpapers Folder
alias wp='cd ~/Pictures/Wallpapers/'

#Move to MAMP Folder
alias MAMP='cd /Applications/MAMP'

#Shows your current public ip address
alias ip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z/<> :]//g"'

#Edit your .bashprofile
alias bp='vim ~/.bash_profile'

#Refreshes .bash_profile
alias bpr='source ~/.bash_profile'

#Lists files by size (in ascending order)
alias size='ls -lrhS'

#Lists all images
alias images='ls ./{*.jpg,*.JPG,*.jpeg,*.psd,*.PSD,*.png,*.gif,*.GIF}'

#Lists number of files in current directory (including files in subdirectories)
alias numfiles='ls -R | wc -cl'

#Lists number of folders in current directory
alias numfolders='ls -l | grep ^d | wc -l'

#Shows number of files (mainly used with piped ex: ls blah | wcl)
alias wcl='wc -l'

#Toggles visability of hidden files in Finder to 'visable'
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'

#Toggles visability of hidden files in Finder to 'hidden'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

#Empties trash
alias trash='sudo rm -Rf ~/.Trash/*'

#Google search. Ex: '} cats and dogs' (without quotes) will google "cats and dogs"
alias }='~/bin/google'

#Opens file (with default application)
alias ]='open'

#Opens current directory (in Finder)
alias ]]='open .'

#Executes python file (with python)
alias p]='python'

#Executes KUGS Playlist editor
alias playlist]='python ~/KUGS/playlist.py'

#SSH's into my ipod with this IP address (at the apartment)
alias sshi='ssh root@192.168.1.103'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#set path for bin
export PATH=$PATH:~/bin

# MacPorts Installer addition on 2012-12-07_at_00:08:27: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export WORKON_HOME=$HOME/.virtualenvs

#Bash Prompt
#export PS1="\u@[1;32m\h[m: \w\`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'\`\n\\$ "


#THIS IS FOR FINK
test -r /sw/bin/init.sh && . /sw/bin/init.sh

##
# Your previous /Users/miles/.bash_profile file was backed up as /Users/miles/.bash_profile.macports-saved_2014-01-03_at_09:33:17
##

# MacPorts Installer addition on 2014-01-03_at_09:33:17: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

