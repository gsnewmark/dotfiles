{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    clojure
    joker
    leiningen
    rlwrap
  ];
}
