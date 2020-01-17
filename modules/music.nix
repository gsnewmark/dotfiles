{ config, lib, pkgs, ... }:

{
  # TODO install pulseaudio-dlna
  environment.systemPackages = with pkgs; [
    # player
    mpc_cli
    mpd
    mpdas
    ncmpcpp

    # additional codecs
    mac # APE

    # track split & tags edit
    cuetools
    kid3
    shntool
  ];

  # THINK default mpd files & dirs? better configure mpd service instead
  # mkdir -p $HOME/.mpd/playlists
  # touch $HOME/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
  # cp /etc/mpdasrc $HOME/.mpdasrc

  # THINK do I need mpd logrotate?
# echo '/home/gsnewmark/.config/mpd/*.log {
#   weekly
#   missingok
#   rotate 7
#   compress
#   notifempty
#   copytruncate
#   create 600
# }' | sudo tee /etc/logrotate.d/mpd
}
