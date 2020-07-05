{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    signal-desktop
    slack
    skypeforlinux
    tdesktop
    zoom-us
  ];
}
