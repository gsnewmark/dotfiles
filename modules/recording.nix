{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # audio
    audio-recorder

    # video/stream
    obs-studio
  ];
}
