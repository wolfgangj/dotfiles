# sh/ksh initialization on login

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
PAGER=less
# remember to skip to next search match in less with 'n'
# (or change direction w/ 'N').
LESS='-R -a -n -i -j3 -P%lb/%L'
EDITOR=mg
export PATH HOME TERM PS1 PAGER LESS EDITOR

# TODO: we shoudn't do this for sh
. ~/.kshrc
ENV=~/.kshrc
export ENV

printf '\e[37m'
date '+%F (%H:%M)'
printf '\e[0m'
