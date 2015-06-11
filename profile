# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"

# set default terminal text editor
TE="emacsclient -t -a emacs"
export VISUAL=$TE
export EDITOR=$TE

eval `/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`
export SSH_AUTH_SOCK
export GPG_AGENT_INFO