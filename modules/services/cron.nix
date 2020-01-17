{ config, lib, pkgs, ... }:

{
  services.cron = {
    enable = true;
  };
}
