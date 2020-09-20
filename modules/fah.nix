{ pkgs, ... }:

{
  # requires nixos-rocm overlay https://github.com/nixos-rocm/nixos-rocm
  nixpkgs.overlays = [ (import ./../overlays/nixos-rocm) ];

  hardware.opengl = { enable = true; };

  environment.systemPackages = with pkgs; [
    rocm-opencl-icd
    rocminfo
    rocm-opencl-runtime
    rocr-ext
    foldingathome
    fahviewer
    fahcontrol
  ];
}
