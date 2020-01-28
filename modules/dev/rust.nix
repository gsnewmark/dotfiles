{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    musl
    rustup
  ];

  # init = ''
  #   if [ ! -d "$RUSTUP_HOME" ]; then
  #     ${pkgs.rustup}/bin/rustup update
  #     ${pkgs.rustup}/bin/rustup default stable
  #     ${pkgs.rustup}/bin/rustup component add rust-src
  #     ${pkgs.rustup}/bin/rustup component add rustfmt
  #     ${pkgs.rustup}/bin/rustup component add clippy
  #   fi
  # '';
}
