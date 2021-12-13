# I'm using Doom Emacs for everything text-related
# https://github.com/hlissner/doom-emacs
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Doom dependencies
    emacsGit
    git
    (ripgrep.override { withPCRE2 = true; })

    # Optional dependencies
    fd
    gnutls
    zstd

    # Module dependencies
    (aspellWithDicts (ds: with ds; [ en en-computers uk ]))
    clj-kondo
    discount # for Markdown
    languagetool
    nixfmt
    proselint
    rustfmt
    # TODO broken package
    # rustracer
    sqlite
    texlive.combined.scheme-medium
    xclip
    xdotool
    xorg.xwininfo
  ];

  fonts.fonts = [ pkgs.emacs-all-the-icons-fonts ];
}
