{ config, lib, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  users.users.gsnewmark.extraGroups = [ "docker" ];
}
