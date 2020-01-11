# Test configuration for a NixOS-based demo VM

{ config, lib, pkgs, ... }:

{
  imports = [
    ./.
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>

    ./modules/desktop/gnome.nix
  ];

  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  users.users.gsnewmark = {
    uid = lib.mkForce 1001;
  };
}
