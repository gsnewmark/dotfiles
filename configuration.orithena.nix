# orithena - my laptop

{ config, lib, pkgs, ... }:

{
  imports = [
    ./.

    # Desktop Environment
    ./modules/desktop/i3.nix

    # Applications
    ./modules/browser.nix
    ./modules/chat.nix
    ./modules/daw.nix
    ./modules/dev
    ./modules/editors/emacs.nix
    ./modules/editors/office.nix
    ./modules/gaming/steam.nix
    ./modules/gaming/wine.nix
    ./modules/graphics.nix
    ./modules/hw.nix
    ./modules/music.nix
    ./modules/shell/fish.nix
    ./modules/vm.nix

    # Services
    ./modules/services/cron.nix
    ./modules/services/dropbox.nix
    ./modules/services/haveged.nix
    ./modules/services/tlp.nix
    ./modules/services/unclutter.nix
  ];

  networking.wireless.enable = true;
  hardware.opengl.enable = true;

  # Optimize power use
  environment.systemPackages = [ pkgs.acpi ];
  powerManagement.enable = true;

  # Monitor backlight control
  programs.light.enable = true;
}
