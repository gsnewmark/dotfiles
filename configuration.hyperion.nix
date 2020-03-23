# hyperion - my desktop

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
    ./modules/fah.nix
    ./modules/gaming.nix
    ./modules/graphics.nix
    ./modules/music.nix
    ./modules/shell/fish.nix
    ./modules/vm.nix

    # Services
    ./modules/services/cron.nix
    ./modules/services/dropbox.nix
    ./modules/services/haveged.nix
    ./modules/services/lorri.nix
    ./modules/services/unclutter.nix
  ];

  networking.hostName = "hyperion";

  # At least 5.2 kernel is needed to support the WiFi adapter
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["acpi_osi=Linux" "iommu=soft"];

  # Update CPU microcode
  hardware.cpu.amd.updateMicrocode  = true;

  # Support dGPU
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
}
