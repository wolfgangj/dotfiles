# ksh initialization

curr_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[0m\]\u@\h:\[\e[37m\]\w \[\e[33m\]$(curr_branch)\[\e[37m\]\$\[\e[0m\] ' 
export PS1

alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -l'
alias la='ls -a'
alias mkdir='mkdir -p'
alias df='df -h'
alias psa='ps -A'

alias e=emacs
alias e.='emacs . &'

alias s='git status'
alias add='git add'
alias addu='git add -u'
alias adda='git add -A'
# tcw = "this commit will ..."
alias tcw='git commit -m'
alias push='git push'
alias pull='git pull'
alias log='git log'
alias d='git diff'
alias ds='git diff --staged'
