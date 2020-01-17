{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    libreoffice-fresh
  ];
}
