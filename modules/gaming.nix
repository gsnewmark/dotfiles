{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    grapejuice
    minecraft
    protontricks
    steam
  ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;
}
