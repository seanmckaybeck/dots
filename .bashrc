# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PS1='\u@\h:\w\n$ '

# set terminal to use 256 colors
[ -z "$TMUX" ] && export TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# make vim default editor
VISUAL=vim; export VISUAL
EDITOR=vim; export EDITOR

unset color_prompt force_color_prompt

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_funcs ]; then
    . ~/.bash_funcs
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# start mpd
[ ! -s ~/.config/mpd/pid ] && mpd

PATH=$PATH:/opt/wine-staging/bin
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
PATH=~/bin:$PATH
