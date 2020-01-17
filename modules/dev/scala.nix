{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    sbt
  ];
}
