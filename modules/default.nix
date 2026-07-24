{ config, pkgs, ... }:

{
  imports = [
    ./core/packages.nix
    ./desktop/niri-system.nix
    ./terminal/ghostty-system.nix
    ./security/agenix.nix
  ];
}
