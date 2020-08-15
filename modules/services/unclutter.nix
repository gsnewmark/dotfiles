{ pkgs, ... }:

{
  services.unclutter = {
    enable = true;
    timeout = 3;
    package = pkgs.unclutter-xfixes;
  };
}
