{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  # TODO install gulp
  environment.systemPackages = with pkgs; [
    nodejs
  ];
}
