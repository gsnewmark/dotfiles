{ config, lib, pkgs, ... }:

{
  # TODO install vcvrack
  environment.systemPackages = with pkgs; [
    # recording audio
    audacity
    audio-recorder

    ardour
    # stable is broken https://github.com/NixOS/nixpkgs/issues/76074
    unstable.lmms

    # synthesizers
    helm
  ];
}
