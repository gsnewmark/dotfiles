{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    bandwhich
    bottom
    curl
    dogdns
    du-dust
    exa
    fd
    gnupg
    htop
    httpie
    hyperfine
    iotop
    jq
    links
    lm_sensors
    lsof
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
