{ config, lib, pkgs, ... }:

{
  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  environment.systemPackages = with pkgs; [ yubioath-desktop ];
}
