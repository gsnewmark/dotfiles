{ pkgs, ... }:

{
  services.unclutter-xfixes = {
    enable = true;
    timeout = 3;
  };
}
