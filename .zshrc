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
export PLAN9=/usr/local/plan9
export PATH_ANDY=~/bin:/usr/local/bin
#export PATH_HASK=~/.cabal/bin
export PATH_RUBY=~/.gem/ruby/1.9.1/bin
export PATH_SLCK=/usr/games:~/.texlive/2009/bin/i386-linux
export PATH=$PATH_ANDY:$PATH_RUBY:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_SLCK

# XDG crap.
export XDG_CACHE_HOME=~/.xdg/cache
export XDG_CONFIG_HOME=~/.xdg/config
export XDG_DATA_HOME=~/.xdg/share
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/share:/usr/local/share

# Places.
export b=/mnt/sda1/backups
export b_prm=/mnt/sdc1/backups
export h=/home/antlec/public_html
export l=/mnt/sdb4/doc
export m=/mnt/sdb4/music
export p=/mnt/sdb4/podcasts
export pw=/home/antlec/public_html/probablyworse
export sb=/mnt/sdb4/pub/slackware/slackbuilds/13.1
export src=/mnt/sdb4/pub/src
export staging=/mnt/sda1/staging
export sw=/mnt/sdb4/pub/slackware/slackware-13.1

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
alias mi="mutagen-inspect"
alias mksl="sudo make install clean"
alias srv="python3 -m http.server"
alias startx="startx -- -dpi 96"
alias t="vi ~/.plan"
alias tar="bsdtar"
alias vbox="/opt/VirtualBox/VirtualBox"

# Mounting stuff.
# 8-track
alias m-br864="mount -L BR864"
alias u-br864="umount /media/BR864"
export ROLAND=/media/BR864/ROLAND/USB
# Sansa Clip+
alias m-clip1="mount -L CLIP1"
alias u-clip1="umount /media/CLIP1"
export CLIP1M=/media/CLIP1/MUSIC

# Pkgtools
alias ipkg="sudo installpkg"
alias rpkg="sudo removepkg"
alias upkg="sudo upgradepkg"

setopt appendhistory autocd extendedglob
unsetopt beep

bindkey -e

# rxvt-unicode
#bindkey "\e[7~" beginning-of-line
#bindkey "\e[8~" end-of-line
# xterm
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
#
# Find out what them keys mean!
# -----------------------------
# Type `C-v`, which is a binding to `quoted-insert`, and then the key of
# which you'd like to see the actual value. E.g.,
#
#     C-v [Home]
# 
# outputs `^[[H`. `^[` is a literal [Esc] keypress. In inputrc syntax,
# [Esc] is expressed with `\e`. Voila! `\e[H`.
#
# Reference
# ---------
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey '^i' expand-or-complete-prefix

zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit

case `tty` in
*/pts/*)
	export TERM=xterm-256color
	;;
esac

case $TERM in
	*xterm*|rxvt*)
		precmd () {print -Pn "\e]0;%n@%m:%~\a"}
		;;
esac
