{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp
    inkscape
    krita
  ];
}
