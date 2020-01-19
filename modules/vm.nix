{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };

  virtualisation.docker.enable = true;

  users.users.gsnewmark.extraGroups = [ "docker" "vboxusers" ];
}
