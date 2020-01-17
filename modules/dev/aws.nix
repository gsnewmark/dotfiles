{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    aws
    s3cmd
  ];
}
