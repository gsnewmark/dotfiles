{
  services.mpd = {
    enable = true;
    user = "gsnewmark";
    group = "users";
    startWhenNeeded = true;
    extraConfig = ''
      replaygain "auto"
      replaygain_preamp "0"
      replaygain_limit "yes"
      volume_normalization "yes"

      audio_output {
        type "pulse"
        name "Pulse output"
        server "127.0.0.1"
        enabled "yes"
      }

      audio_output {
        type "httpd"
        name "FLAC Stream"
        encoder "flac"
        format "44100:16:2"
        port "8000"
        enabled "no"
      }

      decoder {
        plugin "mad"
        enabled "no"
      }

      decoder {
        plugin "ffmpeg"
        enabled "yes"
      }
    '';
  };

  # MPD can't connect to the PulseAudio without this
  hardware.pulseaudio.extraConfig =
    "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
}
