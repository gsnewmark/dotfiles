# Copied from https://github.com/Emiller88/dotfiles/blob/e6929d69f93cd7ec548b7d7ad03d41880dbf51d0/packages/clj-kondo.nix
# Licensed under the MIT license (Copyright (c) 2020 Edmund Miller)
{ stdenv, fetchurl, unzip, zlib, libjack2, autoPatchelfHook }:

let
  inherit (stdenv.hostPlatform) system;

  pname = "clj-kondo";
  version = "2021.04.23";
  plat = {
    x86_64-linux = "linux";
    x86_64-darwin = "macos";
  }.${system};
in stdenv.mkDerivation rec {
  name = "${pname}-${version}";

  src = fetchurl {
    url =
      "https://github.com/borkdude/clj-kondo/releases/download/v${version}/clj-kondo-${version}-${plat}-amd64.zip";
    sha256 = "1s0v8lhrzr8r1c9vfqrdhfz7cyb7m4z53qmfyyznkn142m2z0f8q";
  };

  nativeBuildInputs = [ unzip autoPatchelfHook ];

  buildInputs = [ zlib stdenv.cc.cc.lib ];

  unpackPhase = ''
    unzip -qqo $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    chmod +x ${pname}
    install -v -m755 -D clj-kondo $out/bin
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/borkdude/clj-kondo";
    description = "A linter for Clojure code that sparks joy.";
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    maintainers = with maintainers; [ emiller88 ];
  };
}
