{ pkgs, ... }:

{
  imports = [ ./. ../services/unclutter.nix ];

  services = {
    xserver = {
      enable = true;

      displayManager.gdm = { enable = true; };

      desktopManager = { gnome3 = { enable = true; }; };
    };

    udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  };

  environment.gnome3.excludePackages = with pkgs;
    [ pkgs.gnome3.gnome-terminal ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    # TODO install Material Shell when it's available in packages
    # unstable.gnomeExtensions.material-shell
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.system-monitor
    gnome3.gnome-tweaks
    libnotify
    notify-desktop
    pinentry_gnome
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome3.chrome-gnome-shell.enable = true;
}
