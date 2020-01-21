# Hardware firmware updater

{ config, lib, pkgs, ... }:

{
  services.fwupd = {
    enable = true;
  };
}
