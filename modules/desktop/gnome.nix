{ pkgs, ... }:

{
  imports = [ ./. ../services/unclutter.nix ];

  services = {
    xserver = {
      enable = true;

      displayManager.gdm = { enable = true; };

      desktopManager = { gnome = { enable = true; }; };
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  environment.gnome.excludePackages = with pkgs; [ pkgs.gnome.gnome-terminal ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.pixel-saver
    gnomeExtensions.sound-output-device-chooser
    libnotify
    notify-desktop
    pinentry_gnome
    xorg.xprop
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.chrome-gnome-shell.enable = true;
}
