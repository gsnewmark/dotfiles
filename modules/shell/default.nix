{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    cloc
    curl
    exa
    fd
    fzf
    htop
    httpie
    iftop
    iotop
    links
    lm_sensors
    lsof
    (ripgrep.override {withPCRE2 = true;})
    rsync
    tcpdump
    time
    tree
    tmux
  ];
}
