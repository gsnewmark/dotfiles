# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="pygmalion"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# zsh-syntax-highlighting should be last!
plugins=(git archlinux last-working-dir lein vagrant mvn sbt docker vi-mode zsh-syntax-highlighting)

# Activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# remove auto-correct
unsetopt correct_all

# update dir_colors
eval `dircolors ~/.dir_colors`

# set color mode of terminal
export TERM=xterm-256color

# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"

# set default terminal text editor
TE="emacsclient -t -a emacs"
export VISUAL=$TE
export EDITOR=$TE

# shortcut for terminal emacs
alias e=$TE
# shortcut for terminal emacs with sudo
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
# disable pattern expanding for lein
alias lein="noglob lein"

alias top-10-size="du -hcsx -- *(D) | sort -rh | head -10"

# ZSH highlighter
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Notify when long command is finished
[ -e $HOME/.zsh-notifier/notifyosd.zsh ] && . $HOME/.zsh-notifier/notifyosd.zsh

export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"

export BOOT_JVM_OPTIONS="-Xmx2g -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none"

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh