{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (spotify.override { deviceScaleFactor = 2.0; })

    # additional codecs
    mac # APE

    # track split & tags edit
    cuetools
    shntool
  ];
}
