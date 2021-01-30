{ pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [ fish ];
}
