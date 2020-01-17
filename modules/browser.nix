{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    tridactyl-native

    chromium
    # stable one is not available on the Tor servers anymore
    unstable.tor-browser-bundle-bin
  ];
}
