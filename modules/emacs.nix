# I'm using Doom Emacs for everything text-related
# https://github.com/hlissner/doom-emacs
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Doom dependencies
    emacs
    git
    (ripgrep.override {withPCRE2 = true;})

    # Optional dependencies
    fd
    gnutls
    zstd

    # Module dependencies
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.uk
    discount # for Markdown
    languagetool
    proselint
    sqlite
    texlive.combined.scheme-medium
    wordnet
  ];

  fonts.fonts = [
    pkgs.emacs-all-the-icons-fonts
  ];
}