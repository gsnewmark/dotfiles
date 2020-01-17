# I'm using Doom Emacs for everything text-related
# https://github.com/hlissner/doom-emacs
{ config, lib, pkgs, ... }:

{
  imports = [ ./. ];

  environment.systemPackages = with pkgs; [
    # Doom dependencies
    emacs
    git
    (ripgrep.override {withPCRE2 = true;})

    # Optional dependencies
    fd
    gnutls
    (lib.mkIf (config.programs.gnupg.agent.enable)
      pinentry_emacs)
    zstd

    # Module dependencies

    # Spell checker
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    discount # for Markdown
    languagetool
    proselint
    rustracer
    sqlite
    texlive.combined.scheme-medium
    rustfmt
  ];

  fonts.fonts = [
    pkgs.emacs-all-the-icons-fonts
  ];
}
