{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # spell checker
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.uk
  ];
}
