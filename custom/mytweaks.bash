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

# Safety Nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Apt
alias aps='sudo aptitude search'
alias apu='sudo aptitude update'
alias api='sudo aptitutde install'
 
# custom variables
export HISTSIZE=100000

# set shell options
shopt -s cdspell
shopt -s dirspell

# Mac specific
alias macvim='open -a '/Applications/MacVim.app''
alias socks='ssh -fND 8888 69.175.54.34'
alias tree='find . -print | grep -v .DS_Store | sed -e '\''s;[^/]*/;|____;g;s;____|; |;g'\'''

# Override function from bobby theme
function prompt_command() {
    PS1="${purple}\u${red}@${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
