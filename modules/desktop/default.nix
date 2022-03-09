{ pkgs, ... }:

{
  imports = [ ../services/cron.nix ../services/haveged.nix ];

  nixpkgs.overlays = [
    (self: super: {
      calibre = super.calibre.overrideAttrs (oldAttrs: {
        # DeDRM dependency
        nativeBuildInputs = oldAttrs.nativeBuildInputs
          ++ [ self.python3Packages.pycryptodome ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    # additional sound settings
    alsaUtils
    pavucontrol

    # UI theme & icons
    arc-theme
    papirus-icon-theme
    libsForQt5.qtstyleplugins

    # terminal emulator
    alacritty

    # screen recorders
    flameshot
    peek

    # video player
    ffmpeg
    mpv
    youtube-dl

    # document viewers
    calibre
    foliate
    gnome.eog
    libreoffice
    zathura
    zotero

    # spell checker
    (aspellWithDicts (ds: with ds; [ en en-computers uk ]))

    # web
    networkmanager-openvpn
    thunderbird
    transmission
    transmission-gtk
    protonmail-bridge
    protonvpn-gui

    # network
    mitmproxy
    nmap
    wireshark

    # encryption
    veracrypt

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

  networking.networkmanager.enable = true;
  users.users.gsnewmark.extraGroups = [ "networkmanager" ];

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  hardware.bluetooth = {
    enable = true;
    settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
  };

  services.gnome.gnome-keyring.enable = true;

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      dejavu_fonts
      font-awesome
      iosevka
      noto-fonts-emoji
      source-han-sans-japanese
      source-han-sans-korean
      source-han-sans-simplified-chinese
      source-han-sans-traditional-chinese
      source-sans-pro
      source-serif-pro
      symbola
      veracrypt
      ubuntu_font_family
    ];

    # TODO just use the dotfile
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        autohint = true;
      };
      defaultFonts = {
        sansSerif = [ "Source Sans 3" ];
        serif = [ "Source Serif 4" ];
        monospace = [ "Iosevka" ];
      };
    };
  };
}
