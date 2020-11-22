{ pkgs, ... }:

{
  imports = [ ./. ];

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
    unstable.gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    # TODO install Material Shell when it's available in packages
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.system-monitor
    gnome3.gnome-tweaks
  ];

  services.gnome3.chrome-gnome-shell.enable = true;
}
