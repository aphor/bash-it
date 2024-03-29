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
alias greo='grep --color=auto'
alias grep='grep --color=auto'
alias grpe='grep --color=auto'
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
if [ -e "/usr/bin/apt-get" ];
then
    alias apti='sudo apt-get install'
    alias aptp='sudo apt-get --purge remove'
    alias aptr='sudo apt-get remove'
    alias apts='sudo apt-cache search'
    alias aptsh='sudo apt-cache show'
    alias aptud='sudo apt-get update'
    alias aptug='sudo apt-get upgrade'

elif [ -e "/usr/bin/aptitude" ];
then
    alias apti='sudo aptitude install'
    alias aptp='sudo aptitude purge'
    alias aptr='sudo aptitude remove'
    alias apts='sudo aptitude search'
    alias aptsh='sudo aptitude show'
    alias aptud='sudo aptitude update'
    alias aptug='sudo aptitude safe-upgrade'
fi

# work related

alias fix-svlchi5pwebseq1='ssh root@svlchi5pwebseq1 "killall wsdserver ; /etc/init.d/websequencediagrams restart"'
 
# custom variables
export HISTSIZE=100000

# set shell options
shopt -s cdspell
#shopt -s dirspell
shopt -s nocaseglob

# Mac specific
alias macvim='open -a '/Applications/MacVim.app''
alias tree='find . -print | grep -v .DS_Store | sed -e '\''s;[^/]*/;|____;g;s;____|; |;g'\'''

# Home specific
alias setup_socks5_proxy='ssh -fND 8888 hp'

# Override prompt from bobby theme
function prompt_command() {
    PS1="${purple}\u${red}@${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}
export SET_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PROMPT_COMMAND="$SET_TITLE; history -a; history -c; history -r; $PROMPT_COMMAND"

# Smarter psgrep
function psgrep() {
    ps auwwx | egrep "^USER|$@" | grep -v grep
}

# Smarter locate
function locate() {
    locate=`which locate`
    $locate $@ | xargs ls -lsh   
}

function ssh_addkey() {
    host=$@
    pubkey="$HOME/.ssh/id_rsa.pub"

    if [ ! -e "$pubkey" ]
    then
        echo "No host key to add." 
    elif [ -z "$host" ]
    then
        echo "Missing argument." 
    else
        echo "Appending $HOME/.ssh/id_rsa.pub to $@:"
        cat $pubkey | ssh $host 'sh -c "cat - >>~/.ssh/authorized_keys"'
        echo
    fi

    ssh -X $host
}

function ssh() {
    tmux rename-window "$*"
    command ssh "$@"
    tmux rename-window "bash"
}
