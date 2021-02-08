{ pkgs, ... }:

{
  nixpkgs.config.firefox.enableTridactylNative = true;

  environment.systemPackages = with pkgs; [ firefox-bin chromium ];
}
