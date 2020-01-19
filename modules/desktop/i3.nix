{ config, lib, pkgs, ... }:

{
  imports = [
    ./.
  ];

  # Enable better support for GNOME applications
  programs.dconf.enable = true;

  # XFCE has some problem's with audio if this is not specified
  nixpkgs.config.pulseaudio = true;

  # It's needed to circumvent issues with hardcode path in the i3blocks
  environment.pathsToLink = [ "/libexec" ];

  services = {
    gnome3.gnome-keyring.enable = true;

    xserver = {
      enable = true;

      displayManager.lightdm = {
        enable = true;
        background = "#2e3440";
        greeters.gtk = {
          enable = true;
        };
      };

      desktopManager = {
        default = "xfce";
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          betterlockscreen
          # TODO replace with (text) indicator for panel?
          cbatticon
          dunst
          feh
          gtk-engine-murrine
          i3blocks
          i3lock
          libnotify
          libsForQt5.qtstyleplugins
          notify-desktop
          # TODO replace with (text) indicator for panel
          pa_applet
          rofi
          udiskie
          udisks
          xclip
          xdotool
          xkb-switch
          xorg.xev

          # ranger file manager
          ranger
          atool
          ffmpegthumbnailer
          highlight
          imlib2
          mediainfo
          poppler
          w3m
        ];
      };
    };

    compton = {
      enable = true;
      backend = "glx";
      vSync = true;
    };
  };
}
