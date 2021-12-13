{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ bitwig-studio ];
}
