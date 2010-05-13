#
# ~/.bashrc
#
# Andrew Antle - http://antlechrist.org/
#

#
# Test whether we're interactive.
#
[ -z "$PS1" ] && return

#
# Source the private stuff.
#
# "I knew Colonel Sanders when he was just a Sargeant."
# "Oh, I thought you only knew his privates." :)
#
. ~/.bashrc.private

#
# Exporting these variables makes their values available to other programs.
#
export DSSI_PATH=~/lib/dssi:/usr/lib/dssi
export LADSPA_PATH=~/lib/ladspa:/usr/lib/ladspa
export LV2_PATH=~/lib/lv2:/usr/lib/lv2
export EDITOR=vi
export GOARCH=i386
export GOBIN=~/go/bin
export GOOS=linux
export GOROOT=~/go
export MANWIDTH=80
export PATH_ANDY=~/bin:/usr/local/bin
export PATH_SLCK=/usr/games:/usr/share/texmf/bin
export PLAN9=~/plan9
export PATH=$PATH_ANDY:/bin:/usr/bin:/sbin:/usr/sbin:$PATH_SLCK:$PLAN9/bin

#
# Supposed firefox tweaks to speed it up. I didn't notice a difference.
#
#export MOZ_DISABLE_PANGO=1
#export FIREFOX_DSP=none

#
# My prompts. Keep it simple.
#
export PS1='$ '
export PS2='> '
export PS3='> '
export PS4='+ '

#
# Setup the titlebar, if we've got one.
#
if test "$TERM" = "xterm" -o \
        "$TERM" = "xterm-color" -o \
        "$TERM" = "xterm-256color" -o \
        "$TERM" = "rxvt" -o \
        "$TERM" = "rxvt-unicode" -o \
        "$TERM" = "xterm-xfree86"; then
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
	export PROMPT_COMMAND
fi

#
# Aliases. Life is too short to type more than you must. Especially when you
# hunt and peck like me.
#
alias amail="mail -f $AMAIL_MAILBOX"
alias cd2="cd ../.."
alias emacs="/usr/bin/emacs-22.3-no-x11"
alias gmail="mail -f $GMAIL_MAILBOX"
alias grep="grep --color=auto"
alias la="ls -a"
alias lh="ls -lh"
alias ll="ls -l"
alias ls="ls -F --color=auto --group-directories-first"
alias mem="free -m"
alias mi="mid3v2"
alias mutt="mutt -f ~/mail"
alias startx="startx -- -dpi 96"
alias t="vi ~/.plan"
alias tar="bsdtar"
alias vi="/usr/local/bin/vim"  # The One True Editor

