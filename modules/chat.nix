{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    signal-desktop
    slack
    tdesktop
    zoom-us
  ];
}
