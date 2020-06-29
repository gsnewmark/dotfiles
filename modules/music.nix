{ pkgs, ... }:

{
  imports = [ services/mpd.nix ];

  # TODO install pulseaudio-dlna
  environment.systemPackages = with pkgs; [
    # player
    mpc_cli
    ncmpcpp

    # scrobbler
    mpdas

    # additional codecs
    mac # APE

    # track split & tags edit
    cuetools
    kid3
    shntool
  ];

  # cp /etc/mpdasrc $HOME/.mpdasrc
}
