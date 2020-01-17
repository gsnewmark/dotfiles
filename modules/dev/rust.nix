{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    musl
    rustup
  ];

  env.RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
  env.CARGO_HOME = "$XDG_DATA_HOME/cargo";
  env.PATH = [ "$CARGO_HOME/bin" ];

  init = ''
    if [ ! -d "$RUSTUP_HOME" ]; then
      ${pkgs.rustup}/bin/rustup update
      ${pkgs.rustup}/bin/rustup default stable
      ${pkgs.rustup}/bin/rustup component add rust-src
      ${pkgs.rustup}/bin/rustup component add rustfmt
      ${pkgs.rustup}/bin/rustup component add clippy
    fi
  '';
}
