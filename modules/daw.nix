{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ unstable.bitwig-studio ];
}
