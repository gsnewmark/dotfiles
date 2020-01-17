{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  # TODO install fisher (needs custom package)
  environment.systemPackages = with pkgs; [
    fish
  ];
}
