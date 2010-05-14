#
# ~/.zshrc
#
# Andrew Antle - http://antlechrist.org/
#

DSSI_PATH=~/lib/dssi:/usr/lib/dssi
LADSPA_PATH=~/lib/ladspa:/usr/lib/ladspa
LV2_PATH=~/lib/lv2:/usr/lib/lv2
EDITOR=vi
GOARCH=386
GOBIN=~/.go/bin
GOOS=linux
GOROOT=~/.go
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
LC_COLLATE=C
PLAN9=/usr/local/plan9
PATH_ANDY=~/bin:/usr/local/bin
PATH_HASK=~/.cabal/bin
PATH_PERL=/usr/bin/perlbin/core
PATH_RUBY=~/.gem/ruby/1.9.1/bin
PATH_SBCL=~/.sbcl/bin
PATH=$PATH_ANDY:$PATH_HASK:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_PERL:$PLAN9/bin
PS1="%n@%m:%1~%# "

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

setopt appendhistory autocd extendedglob
unsetopt beep

bindkey -e

bindkey "\e[3~" delete-char
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey '^i' expand-or-complete-prefix

zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit

case $TERM in
	rxvt*)
		precmd () {print -Pn "\e]0;%n@%m:%~\a"}
		;;
esac
