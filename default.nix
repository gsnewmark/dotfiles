# Based on https://github.com/hlissner/dotfiles/blob/f0642a0f56c37029507b7ae2f67a2ec4d7974f5c/default.nix

# Common configuration across systems. This should be required by
# configuration.$HOSTNAME.nix files.

{ config, pkgs, options, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
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
    allowUnfree = true;

    packageOverrides = pkgs: {
      unstable = import <nixpkgs-unstable> {
        config = config.nixpkgs.config;
      };
    };
  };

  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment = {
    systemPackages = with pkgs; [
      coreutils
      git
      killall
      openssh
      stow
      unzip
      vim
      wget

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

  users.users.gsnewmark = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.fish;
  };

  networking.firewall.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
