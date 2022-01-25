# orithena - my laptop

{ pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix

    # Desktop Environment
    ../../modules/desktop/gnome.nix

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
    ../../modules/yubikey.nix

    # Additional services
    ../../modules/services/dropbox.nix
    ../../modules/services/fwupd.nix
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

  # Support dGPU & iGPU & power management
  environment.systemPackages = [ nvidia-offload pkgs.acpi ];
  powerManagement.enable = true;
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Monitor backlight control
  programs.light.enable = true;
}
