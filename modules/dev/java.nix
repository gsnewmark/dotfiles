{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  # TODO create package for the eclipse mat
  environment.systemPackages = with pkgs; [
    jdk
    jdk11
    maven
    visualvm
  ];
}
