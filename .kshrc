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
alias man='man -T ascii'
alias cal='cal -m'
alias gdb='egdb'

alias e=emacs
alias e.='emacs . &'

# tcw = "this commit will ..."
tcw() {
  git commit -m "$*"
}
amend() {
  git commit --amend -m "$*"
}

alias s='git status'
alias add='git add'
alias addu='git add -u'
alias adda='git add -A'
alias push='git push'
alias pull='git pull'
alias co='git checkout'
alias b='git checkout -b'
alias log='git log'
alias d='git diff'
alias ds='git diff --staged'
alias merge='git merge'
alias blame='git blame'
