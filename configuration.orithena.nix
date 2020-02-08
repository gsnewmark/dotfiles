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
    ./modules/dev.nix
    ./modules/emacs.nix
    ./modules/gaming.nix
    ./modules/graphics.nix
    ./modules/music.nix
    ./modules/shell/fish.nix
    ./modules/vm.nix

    # Services
    ./modules/services/cron.nix
    ./modules/services/dropbox.nix
    ./modules/services/fwupd.nix
    ./modules/services/haveged.nix
    ./modules/services/lorri.nix
    ./modules/services/tlp.nix
    ./modules/services/unclutter.nix
  ];

  networking.hostName = "orithena";

  # Fix X freezing
  boot.kernelParams = ["acpi_rev_override=1"];

  # Support dGPU & iGPU
  hardware.opengl.enable = true;
  hardware.bumblebee.enable = true;

  # Optimize power use
  environment.systemPackages = [ pkgs.acpi ];
  powerManagement.enable = true;

  # Monitor backlight control
  programs.light.enable = true;
}
