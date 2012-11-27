#!/usr/bin/env bash
#
#  Eventually I need to set these based on whether you're on OSX vs Linux vs etc.

# unset things from .bash_it
unset t

# Better output
alias mount='mount |column -t'
alias j='jobs -l'
alias df='df -h'
alias du='du -h'
alias g='grep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# git
alias gd="git diff | $EDITOR -"

# Safety Nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# aptitude/apt-get
if [ -e "/usr/bin/aptitude" ];
then
    alias aptininstall='sudo aptitude install'
    alias aptpurge='sudo aptitude purge'
    alias aptremove='sudo aptitude remove'
    alias aptsearch='sudo aptitude search'
    alias aptshow='sudo aptitude show'
    alias aptupdate='sudo aptitude update'
    alias aptupgrade='sudo aptitude safe-upgrade'
    break

elif [ -e "/usr/bin/apt-get" ];
then
    alias aptinstall='sudo apt-get install'
    alias aptpurge='sudo apt-get --purge remove'
    alias aptremove='sudo apt-get remove'
    alias aptsearch='sudo apt-cache search'
    alias aptshow='sudo apt-cache show'
    alias aptshowpkg='sudo apt-cache showpkg'
    alias aptupdate='sudo apt-get update'
    alias aptupgrade='sudo apt-get upgrade'
fi
 
# custom variables
export HISTSIZE=100000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# set shell options
shopt -s cdspell
shopt -s dirspell

# Mac specific
alias macvim='open -a '/Applications/MacVim.app''
alias tree='find . -print | grep -v .DS_Store | sed -e '\''s;[^/]*/;|____;g;s;____|; |;g'\'''

# Home specific
alias proxy_up='ssh -fND 8888 69.175.54.34'

# Override function from bobby theme
function prompt_command() {
    PS1="${purple}\u${red}@${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

# Smarter psgrep
function psgrep() {
    ps auwwx | egrep "^USER|$@" | grep -v grep
}
