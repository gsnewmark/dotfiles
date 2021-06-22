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
    gnomeExtensions.gnome-shell-extension-appindicator-support
    gnomeExtensions.gnome-shell-extension-blur-my-shell
    gnomeExtensions.gnome-shell-extension-caffeine
    gnomeExtensions.gnome-shell-extension-sound-output-device-chooser
    gnome.gnome-tweaks
    libnotify
    notify-desktop
    pinentry_gnome
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
