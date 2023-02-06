## Environment Variables

set -gx TERM xterm-256color

set -gx PATH ~/bin ~/.cargo/bin ~/.emacs.d/bin ~/go/bin $PATH

set -l TE "emacs -nw"
set -gx VISUAL emacs
set -gx EDITOR $TE

set -gx CARGO_HOME ~/.cargo

set -gx XDG_DATA_HOME "$HOME/.local/share"

## Aliases

# shortcut for terminal emacs
alias e $TE

# shortcut for terminal emacs with sudo
alias E "env SUDO_EDITOR=\"emacs -nw\" sudoedit"

alias top-10-size "du -hcx --max-depth=1 | sort -rh | head -10"

alias cached-writes "rg -e Dirty: -e Writeback: /proc/meminfo"

## vi mode

fish_vi_key_bindings 2>/dev/null

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# NOTE fix vim mode fish cursor in alacritty https://github.com/fish-shell/fish-shell/issues/7458
function fish_mode_prompt
    switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        case replace_one
            echo -en "\e[4 q"
        case visual
            echo -en "\e[2 q"
        case '*'
            echo -en "\e[2 q"
    end
    set_color normal
end

## fzf

set -gx FZF_DEFAULT_OPTS '--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

## direnv integration

direnv hook fish | source

## zoxide integration

zoxide init fish --cmd g | source

## Prompt

set fish_greeting
