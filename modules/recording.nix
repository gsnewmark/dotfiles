{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # audio
    audacity
    audio-recorder

    # video/stream
    obs-studio
  ];
}
