{ pkgs, ... }:

{
  # TODO install vcvrack
  environment.systemPackages = with pkgs; [
    ardour

    # synthesizers
    helm
  ];
}
