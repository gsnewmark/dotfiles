{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ lutris steam ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
}
