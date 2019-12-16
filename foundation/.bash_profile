# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# add Rust cargo binaries to PATH
export PATH=~/.cargo/bin:$PATH

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export CUDA_HOME=/opt/cuda/

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# set default terminal text editor
TE="emacs -nw"
export VISUAL=$TE
export EDITOR=$TE

export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
