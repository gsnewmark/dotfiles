{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    slack
    # stable one is couldn't be downloaded anymore
    unstable.skypeforlinux
    tdesktop
    zoom-us
  ];
}
