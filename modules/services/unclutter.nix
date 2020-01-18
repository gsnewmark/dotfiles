{ config, lib, pkgs, ... }:

{
  services.unclutter = {
    enable = true;
    timeout = 3;
  }; 
}
