{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    curl
    exa
    fd
    fzf
    gnupg
    htop
    httpie
    iftop
    iotop
    jq
    links
    lm_sensors
    lsof
    (ripgrep.override { withPCRE2 = true; })
    rsync
    tcpdump
    time
    tokei
    tree
    tmux
  ];
}
