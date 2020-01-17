{ config, lib, pkgs, ... }:

{
  # TODO check DXVK works
  environment.systemPackages = with pkgs; [
    wineWowPackages.staging
  ];
}
