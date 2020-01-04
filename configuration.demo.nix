# Test configuration for a NixOS-based demo VM

{ config, lib, pkgs, ... }:

{
  imports = [
    ./.
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
  ];

  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  users.users.gsnewmark = {
    uid = lib.mkForce 1001;
  };
}
