if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# dont have to worry about forgetting the p flag when opening multiple files
alias vim='vim -p'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias c='clear'
alias now='date +"%T'
alias today='date +"%d-%m-%Y"'
alias svim='sudo vim -p'
alias ping='ping -c 5'

# os dependant aliases
# if [ $(which yum) ]
# then
#     alias yum='sudo yum'
#     alias update='sudo yum update'
#     alias upgrade='sudo apt-get update && sudo apt-get upgrade'
# elif [ $(which apt-get) ]
# then
#     alias apt-get='sudo apt-get'
#     alias update='sudo apt-get update'
#     alias upgrade='sudo apt-get update && sudo apt-get upgrade'
# fi

# git aliases
alias gca='git commit -a'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gpl='git pull'
alias gps='git push'
alias gr='git rm -fr'
alias gl='git log'
alias gcl='git clone'
alias gi='git init'

# get current public ip
alias pubip='curl icanhazip.com'

# display disk size in MB
alias df='df -h'

# count number of lines in file
alias count='wc -l'

#alias tweet='~/lazy_tweet/tweeter.sh'
