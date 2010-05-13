#
# ~/.bash_profile
#
# Andrew Antle - http://antlechrist.org/
#

#
# Setup keychain so I don't have to provide a password every time I ssh in
# somewhere.
#
eval `keychain --eval id_rsa`

#
# Source ~/.bashrc.
#
. ~/.bashrc

