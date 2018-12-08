# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# add Rust cargo binaries to PATH
export PATH=~/.cargo/bin:$PATH

# set default terminal text editor
TE="emacsclient -c -t -a vim"
export VISUAL=$TE
export EDITOR=$TE

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export CUDA_HOME=/opt/cuda/