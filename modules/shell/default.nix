{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    bandwhich
    curl
    du-dust
    exa
    fd
    fzf
    gnupg
    htop
    httpie
    hyperfine
    iotop
    jq
    links
    lm_sensors
    lsof
    mcfly
    procs
    (ripgrep.override { withPCRE2 = true; })
    rsync
    sd
    tcpdump
    tealdeer
    time
    tokei
    tree
    tmux
    zoxide
  ];
}
