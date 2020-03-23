{ pkgs, ... }:

{
  nixpkgs.overlays = [ (import ./../overlays/nixos-rocm) ];

  hardware.opengl = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    rocm-opencl-icd
    rocminfo
    rocm-opencl-runtime
    rocr-ext
    unstable.foldingathome
    unstable.fahviewer
    unstable.fahcontrol
  ];
}
