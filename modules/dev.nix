{ pkgs, ... }:

{
  imports = [ services/lorri.nix ];

  environment.systemPackages = with pkgs; [
    # AWS
    aws-mfa
    awscli2
    s3cmd

    # Clojure
    clojure
    eclipse-mat
    jdk
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
