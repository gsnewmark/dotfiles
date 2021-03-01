{ pkgs, ... }:

{
  imports = [ services/lorri.nix ];

  environment.systemPackages = with pkgs; [
    # AWS
    awscli
    s3cmd

    # Clojure
    clojure
    jdk11
    leiningen
    visualvm
    # TODO create package for the eclipse mat

    # Python
    python37

    # Rust
    musl
    rustup
    # TODO switch to latest stable Rust and install clippy, rust-src, rustfmt
    # rustup toolchain install stable
    # rustup default stable
    # rustup component add clippy
    # rustup component add rust-src

    # Common libraries & tools
    clang
    gdb
    openssl
    rlwrap
  ];
}
