# I'm using Doom Emacs for everything text-related
# https://github.com/hlissner/doom-emacs
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Doom dependencies
    # TODO switch back to emacsUnstable/emacsGcc when packages are updated to work with it
    emacs
    git
    (ripgrep.override { withPCRE2 = true; })

    # Optional dependencies
    fd
    gnutls
    zstd

    # Module dependencies
    (aspellWithDicts (ds: with ds; [ en en-computers uk ]))
    my.clj-kondo
    discount # for Markdown
    languagetool
    nixfmt
    proselint
    rustfmt
    rustracer
    sqlite
    texlive.combined.scheme-medium
    wordnet
  ];

  fonts.fonts = [ pkgs.emacs-all-the-icons-fonts ];
}
