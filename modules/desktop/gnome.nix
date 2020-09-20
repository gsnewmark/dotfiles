{ pkgs, ... }:

{
  imports = [ ./. ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  environment.systemPackages = with pkgs; [ gnome3.gnome-tweaks ];
}
