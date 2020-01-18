{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    cloc
    curl
    exa
    fd
    fzf
    gnupg
    htop
    httpie
    iftop
    iotop
    links
    lm_sensors
    lsof
    pinentry
    (ripgrep.override {withPCRE2 = true;})
    rsync
    tcpdump
    time
    tree
    tmux
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  systemd.user.services.gpg-agent.serviceConfig.ExecStart = [
    "" ''
       ${pkgs.gnupg}/bin/gpg-agent \
            --supervised \
            --allow-emacs-pinentry \
            --default-cache-ttl 1800 \
            --pinentry-program ${pkgs.pinentry}/bin/pinentry-gtk-2
       ''
  ];
}
