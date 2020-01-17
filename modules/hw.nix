{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hardware firmware updater
    fwupd
    # Logitech mouse management
    solaar
  ];
}
