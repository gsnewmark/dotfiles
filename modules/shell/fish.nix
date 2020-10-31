{ pkgs, ... }:

{
  imports = [ ./. ];

  # TODO install fisher (needs custom package) or manually install
  # required fish plugins
  environment.systemPackages = with pkgs; [ fish ];
}
