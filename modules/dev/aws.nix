{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    awscli
    s3cmd
  ];
}
