# ~/.zprofile
# Andrew Antle - http://antlechrist.org/

# Setup keychain so I don't have to provide a password every time I ssh in
# somewhere.
eval `keychain --eval -q id_rsa`

# Source ~/.zshrc.
. ~/.zshrc
