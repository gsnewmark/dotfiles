{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # common libs
    openssl
  ];
}
