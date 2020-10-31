{ pkgs, ... }:

{
  imports = [ ../services/cron.nix ../services/haveged.nix ];

  environment.systemPackages = with pkgs; [
    # additional sound settings
    alsaUtils
    pavucontrol

    # UI theme & icons
    arc-theme
    papirus-icon-theme
    libsForQt5.qtstyleplugins

    # terminal emulator
    termite

    # screen recorders
    flameshot
    peek

    # video player
    ffmpeg
    mpv
    youtube-dl

    # document viewers
    calibre
    gnome3.eog
    libreoffice-still
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
    protonvpn-cli

    # network
    mitmproxy
    nmap
    wireshark

    # encryption
    truecrypt

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
  hardware.pulseaudio.enable = true;

  services.gnome3.gnome-keyring.enable = true;

  fonts = {
    enableFontDir = true;
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
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
        monospace = [ "Iosevka" ];
      };
    };
  };
}
