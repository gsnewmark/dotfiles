{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clojure
    joker
    leiningen
    rlwrap
  ];
}
