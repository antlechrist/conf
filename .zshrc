# ~/.zshrc
# Andrew Antle - http://antlechrist.org/

# Source the private stuff.
#
# "I knew Colonel Sanders when he was just a Sargeant."
# "Oh, I thought you only knew his privates." :)
. ~/.private

# Exporting these variables makes their values available to other programs.
export EDITOR=vi
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export LC_COLLATE=C
export MANPATH=~/man:/usr/local/man:/usr/man
export MANWIDTH=80
export PLAN9=~/plan9
export PATH_ANDY=~/bin:/usr/local/bin
export PATH_HASK=~/.cabal/bin
export PATH_SLCK=/usr/games:/usr/share/texmf/bin
export PATH=$PATH_ANDY:$PATH_HASK:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_SLCK

# XDG crap.
export XDG_CACHE_HOME=~/.xdg/cache
export XDG_CONFIG_HOME=~/.xdg/config
export XDG_DATA_HOME=~/.xdg/share
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/share:/usr/local/share

# Places.
export b=/mnt/sdc1/backups
export h=/home/antlec/public_html
export p=/mnt/sdb4/podcasts
export sb=/mnt/sdb4/pub/slackware/slackbuilds/13.1/

# Unset things which annoy me on Slackware, but which others find useful
# and/or necessary.
unset JAVA_HOME
unset KDEDIRS

# My prompts. Keep it simple.
export PS1='$ '
export PS2='> '
export PS3='> '
export PS4='+ '

alias amail="mail -f $AMAILBOX"
alias cd2="cd ../.."
alias ei="mg"
alias gmail="mail -f $GMAILBOX"
alias grep="grep --color=auto"
alias la="ls -a"
alias lh="ls -lh"
alias ll="ls -l"
alias ls="ls -F --color=auto --group-directories-first"
alias mem="free -m"
alias mi="mid3v2"
alias mksl="sudo make install clean"
alias startx="startx -- -dpi 96"
alias t="vi ~/.plan"
alias tar="bsdtar"

# Pkgtools
alias ipkg="sudo installpkg"
alias rpkg="sudo removepkg"
alias upkg="sudo upgradepkg"

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
	*xterm*|rxvt*)
		precmd () {print -Pn "\e]0;%n@%m:%~\a"}
		;;
esac
