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
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.sound-output-device-chooser
    gnome.gnome-tweaks
    libnotify
    notify-desktop
    pinentry_gnome
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.chrome-gnome-shell.enable = true;
}
