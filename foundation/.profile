# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Rust cargo binaries to PATH
export PATH=~/.cargo/bin:$PATH

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# set default terminal text editor
TE="emacs -nw"
export VISUAL=$TE
export EDITOR=$TE

if [ -n "$DESKTOP_SESSION" ]; then
    export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
fi
