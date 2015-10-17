# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"

# set default terminal text editor
TE="emacsclient -t -a emacs"
export VISUAL=$TE
export EDITOR=$TE

if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi