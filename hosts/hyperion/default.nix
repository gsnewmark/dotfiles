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

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "acpi_osi=Linux" "iommu=soft" ];

  hardware.cpu.amd.updateMicrocode = true;

  # Support dGPU
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  environment.systemPackages = with pkgs; [ vulkan-tools ];

  # Set MPD music directory
  services.mpd.musicDirectory = "/mnt/data/raw-music";

  # High-DPI console
  hardware.video.hidpi.enable = true;
}
