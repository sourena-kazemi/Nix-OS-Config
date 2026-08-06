{ config, pkgs, ... }:

{
  imports = [
    ./core/packages.nix
    ./desktop/niri-system.nix
    ./desktop/quickshell-system.nix
    ./terminal/ghostty-system.nix
    ./security/agenix.nix
    ./input/keyd-service.nix
  ];
}
