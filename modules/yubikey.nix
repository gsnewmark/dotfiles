{ config, lib, pkgs, ... }:

{
  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager-qt
    yubioath-desktop
  ];
}
