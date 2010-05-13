#
# ~/.kshrc
#
# Andrew Antle - http://antlechrist.org/
#

set -o emacs

EDITOR=mg
HISTFILE=~/.ksh_hist
LC_COLLATE=C
PLAN9=/usr/local/plan9
PATH_ANDY=~/bin:/usr/local/bin
PATH_HASK=~/.cabal/bin
PATH_PERL=/usr/bin/perlbin/core
PATH_RUBY=~/.gem/ruby/1.9.1/bin
PATH_SBCL=~/.sbcl/bin
PATH=$PATH_ANDY:$PATH_HASK:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_PERL:$PLAN9/bin
PS1='\u:\w> '
VISUAL=emacs

export LC_COLLATE

alias cd2='cd ../..'
alias grep='grep --color=auto'
alias la='ls -a'
alias lh='ls -lh'
alias ll='ls -l'
alias ls='ls -F --color=auto --group-directories-first'
alias lsd='ls /var/run/daemons'
alias mem='free -m'
alias mi='mid3v2'
alias mkdir='mkdir -p'
alias mksl='sudo make install clean'
alias pSyu='sudo pacman -Syu'
alias ps='ps -e'
alias startx='startx -- -dpi 96'
alias t="vim ~/.todo.txt"

