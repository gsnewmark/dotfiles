{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    spotify

    # additional codecs
    mac # APE

    # track split & tags edit
    cuetools
    shntool
  ];
}
