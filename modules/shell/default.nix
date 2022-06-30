{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    bandwhich
    bottom
    curl
    dogdns
    du-dust
    duf
    exa
    fd
    fzf
    gnupg
    htop
    httpie
    hyperfine
    iotop
    jq
    links2
    lm_sensors
    lsof
    procs
    (ripgrep.override { withPCRE2 = true; })
    rsync
    sd
    tcpdump
    time
    tokei
    tree
    viddy
    zoxide
  ];
}
