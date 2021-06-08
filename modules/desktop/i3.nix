{ pkgs, ... }:

{
  imports = [ ./. ../services/unclutter.nix ];

  # Enable better support for GNOME applications
  programs.dconf.enable = true;

  # XFCE has some problem's with audio if this is not specified
  nixpkgs.config.pulseaudio = true;

  # It's needed to circumvent issues with hardcode path in the i3blocks
  environment.pathsToLink = [ "/libexec" ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  services = {
    xserver = {
      enable = true;

      displayManager.lightdm = {
        enable = true;
        greeters.gtk = {
          enable = true;
          extraConfig = ''
            background = #2e3440
          '';
        };
      };

      desktopManager = {
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
          dunst
          feh
          gnome.cheese
          gnome.gnome-disk-utility
          gtk-engine-murrine
          i3blocks
          i3lock
          libnotify
          notify-desktop
          # TODO replace with (text) indicator for panel
          pa_applet
          pinentry_gnome
          rofi
          udiskie
          udisks
          xclip
          xdotool
          xkb-switch
          xorg.xev
        ];
      };

      displayManager.defaultSession = "xfce+i3";
    };

    picom = {
      enable = true;
      backend = "glx";
      vSync = true;
    };
  };
}
