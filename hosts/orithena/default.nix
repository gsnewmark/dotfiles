# orithena - my laptop

{ pkgs, ... }:

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
    ../../modules/services/fwupd.nix
    ../../modules/services/tlp.nix
  ];

  networking.hostName = "orithena";

  # Fix X freezing
  boot.kernelParams = [
    "acpi_osi=Linux"
    "acpi_rev_override=1"
    "iommu=soft"
    "idle=nomwait"
    "nouveau.modeset=0"
    "nouveau.runpm=0"
  ];
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Update CPU microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Support dGPU & iGPU
  hardware.opengl.enable = true;
  hardware.bumblebee.enable = true;

  # Optimize power use & add battery indicator
  environment.systemPackages = [
    pkgs.acpi
    # TODO replace with (text) indicator for panel?
    pkgs.cbatticon
  ];
  powerManagement.enable = true;

  # Monitor backlight control
  programs.light.enable = true;
}
