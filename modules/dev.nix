{ pkgs, ... }:

{
  imports = [ services/lorri.nix ];

  environment.systemPackages = with pkgs; [
    # AWS
    awscli
    s3cmd

    # Clojure
    clojure
    eclipse-mat
    jdk11
    leiningen
    visualvm

    # Python
    python3

    # Rust
    musl
    rustup

    # Common libraries & tools
    clang
    gdb
    openssl
    rlwrap
  ];
}
