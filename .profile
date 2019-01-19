# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
PAGER=less
# with -R instead of -r, "less" had trouble with UTF-8 when $LANG was
# just en_US.  However, setting it to en_US.UTF-8 makes "man" break.
LESS='-r -P%lb/%L'
EDITOR=mg
export PATH HOME TERM PS1 PAGER LESS EDITOR

# TODO: we shoudn't do this for sh
. ~/.kshrc
ENV=~/.kshrc
export ENV

printf '\e[37m'
date '+%F (%H:%M)'
printf '\e[0m'
