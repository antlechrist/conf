# ~/.bashrc
# Andrew Antle - http://antlechrist.org/

# Test whether we're interactive.
[ -z "$PS1" ] && return

# Source the private stuff.
#
# "I knew Colonel Sanders when he was just a Sargeant."
# "Oh, I thought you only knew his privates." :)
. ~/.bash_private

# Exporting these variables makes their values available to other programs.
export EDITOR=vim
export GOARCH=i386
export GOBIN=~/go/bin
export GOOS=linux
export GOROOT=~/go
export MANPATH=~/man:/usr/local/man:/usr/man
export MANWIDTH=80
export PATH_ANDY=~/bin:/usr/local/bin
export PATH_SLCK=/usr/games:/usr/share/texmf/bin
export PLAN9=~/plan9
export PATH=$PATH_ANDY:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_SLCK

# XDG crap.
export XDG_CACHE_HOME=~/.xdg/cache
export XDG_CONFIG_HOME=~/.xdg/config
export XDG_DATA_HOME=~/.xdg/share
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/share:/usr/local/share

# Places.
export h=/home/antlec/public_html
export b=/mnt/sdc1/backups

# Supposed firefox tweaks to speed it up. I didn't notice a difference.
#export MOZ_DISABLE_PANGO=1
#export FIREFOX_DSP=none

# Unset things which annoy me on Slackware, but which others find useful
# and/or necessary.
unset JAVA_HOME
unset KDEDIRS

# My prompts. Keep it simple.
export PS1='$ '
export PS2='> '
export PS3='> '
export PS4='+ '

case `tty` in
*/pts/*)
	export TERM=xterm-256color
	;;
esac

# Setup the titlebar, if we've got one.
if test "$TERM" = "xterm" -o \
        "$TERM" = "xterm-color" -o \
        "$TERM" = "xterm-256color" -o \
        "$TERM" = "rxvt" -o \
        "$TERM" = "rxvt-unicode" -o \
        "$TERM" = "xterm-xfree86"; then
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
	export PROMPT_COMMAND
fi

# Aliases. Life is too short to type more than you must. Especially when
# you hunt and peck like me.
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
alias vi="vim"

# Pkgtools
alias ipkg="sudo installpkg"
alias rpkg="sudo removepkg"
alias upkg="sudo upgradepkg"
