{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    slack
    skypeforlinux
    tdesktop
    zoom
  ];
}
