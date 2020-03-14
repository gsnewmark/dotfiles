{ config, lib, pkgs, ... }:

{
  # TODO install vcvrack
  environment.systemPackages = with pkgs; [
    # recording audio
    audacity
    audio-recorder

    ardour

    # synthesizers
    helm
  ];
}
