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
    ./modules/dev/aws.nix
    ./modules/dev/clojure.nix
    ./modules/dev/gdb.nix
    ./modules/dev/haskell.nix
    ./modules/dev/java.nix
    ./modules/dev/js.nix
    ./modules/dev/python.nix
    ./modules/dev/rust.nix
    ./modules/dev/scala.nix
    ./modules/editors/emacs.nix
    ./modules/editors/office.nix
    ./modules/gaming/steam.nix
    ./modules/graphics.nix
    ./modules/music.nix
    ./modules/shell/fish.nix
    ./modules/vm.nix

    # Services
    ./modules/services/cron.nix
    ./modules/services/dropbox.nix
    ./modules/services/fwupd.nix
    ./modules/services/haveged.nix
    ./modules/services/tlp.nix
    ./modules/services/unclutter.nix
  ];

  networking.hostName = "orithena";

  # Support dGPU & iGPU
  hardware.opengl.enable = true;
  hardware.bumblebee.enable = true;

  # Optimize power use
  environment.systemPackages = [ pkgs.acpi ];
  powerManagement.enable = true;

  # Monitor backlight control
  programs.light.enable = true;
}
