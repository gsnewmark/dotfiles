{ config, lib, pkgs, ... }:

{
  services.haveged = {
    enable = true;
  };
}
