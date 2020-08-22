# hyperion - my desktop

{ lib, pkgs, ... }:

{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix

    # Desktop Environment
    ../../modules/desktop/i3.nix

    # Applications
    ../../modules/browser.nix
    ../../modules/chat.nix
    ../../modules/daw.nix
    ../../modules/dev.nix
    ../../modules/emacs.nix
    ../../modules/gaming.nix
    ../../modules/graphics.nix
    ../../modules/music.nix
    ../../modules/recording.nix
    ../../modules/shell/fish.nix
    ../../modules/vm.nix

    # Additional services
    ../../modules/services/dropbox.nix
  ];

  networking.hostName = "hyperion";

  # At least 5.2 kernel is needed to support the WiFi adapter
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "acpi_osi=Linux" "iommu=soft" ];

  # Update CPU microcode
  hardware.cpu.amd.updateMicrocode = true;

  # Support dGPU
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Set MPD music directory
  services.mpd.musicDirectory = "/mnt/data/raw-music";

  # High-DPI console
  console.font =
    lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  console.earlySetup = true;
}
