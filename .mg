#
# ~/.mg
#
# Andrew Antle - http://antlechrist.org/
#

#
# Fix delete key so that it deletes to the right.
#
global-set-key "\e[3~" delete-char

#
# Like textwidth=72 in vim...
#
set-default-mode fill
set-fill-column 72

#
# Indent like K&R.
#
auto-execute *.c c-mode

#
# Uncomment to toggle the creation of backups. As far as I know, you cannot
# specify a backup directory like vim or emacs.
#
#make-backup-files

