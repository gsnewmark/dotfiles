{ config, lib, pkgs, ... }:

{
  # TODO make package for pyenv
  environment.systemPackages = with pkgs; [
    python27Packages.Fabric
    python37
    python37Packages.black
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.virtualenv
    python37Packages.virtualenvwrapper
    tk
  ];
}
