# Test configuration for a NixOS-based demo VM

{ config, lib, pkgs, ... }:

{
  imports = [
    ./.
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>

    # Desktop Environment
    ./modules/desktop/gnome.nix

    # Applications
    ./modules/browser.nix
    ./modules/chat.nix
    ./modules/daw.nix
    ./modules/dev
    ./modules/editors/emacs.nix
    ./modules/editors/office.nix
    ./modules/gaming/steam.nix
    ./modules/graphics.nix
    ./modules/music.nix
    ./modules/shell/fish.nix

    # Services
    ./modules/services/cron.nix
    ./modules/services/dropbox.nix
    ./modules/services/haveged.nix
    ./modules/services/tlp.nix
    ./modules/services/unclutter.nix
  ];

  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  users.users.gsnewmark = {
    uid = lib.mkForce 1001;
  };
}
