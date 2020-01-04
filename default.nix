# Based on https://github.com/hlissner/dotfiles/blob/f0642a0f56c37029507b7ae2f67a2ec4d7974f5c/default.nix

# Common configuration across systems. This should be required by
# configuration.$HOSTNAME.nix files.

{ config, pkgs, options, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    <home-manager/nixos>
  ];

  nix = {
    nixPath = options.nix.nixPath.default ++ [
      "config=/etc/dotfiles/config"
      "packages=/etc/dotfiles/packages"
    ];
    autoOptimiseStore = true;
    trustedUsers = [ "root" "@wheel" ];
  };
  nixpkgs.config = {
    # Forgive me Stallman senpai
    allowUnfree = true;

    packageOverrides = pkgs: {
      unstable = import <nixpkgs-unstable> {
        config = config.nixpkgs.config;
      };
    };
  };

  # Nothing in /tmp should survive a reboot
  boot.cleanTmpDir = true;
  # Use simple bootloader; I prefer the on-demand BIOs boot menu
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment = {
    systemPackages = with pkgs; [
      # Just the bear necessities~
      coreutils
      git
      killall
      openssh
      unzip
      vim
      wget

      # Support for extra filesystems
      sshfs
      exfat
      ntfs3g
    ];
    # These are the defaults, but some applications are buggy when these lack
    # explicit values.
    variables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
    };
  };

  time.timeZone = "Europe/Kiev";
  location = {
    latitude = 50.4501;
    longitude = 30.5234;
  };

  # Set up gsnewmark user account
  users.users.gsnewmark = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "video" "networkmanager" "vboxusers" ];
    shell = pkgs.fish;
  };

  home-manager.users.gsnewmark = {
    xdg.enable = true;
    # TODO move all scripts to bin
    # home.file."bin" = { source = ./bin; recursive = true; };
  };

  networking.firewall.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
