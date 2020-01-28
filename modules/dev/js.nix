{ config, lib, pkgs, ... }:

{
  # TODO install gulp
  environment.systemPackages = with pkgs; [
    nodejs
  ];
}
