{ config, pkgs, ... }:

{
  imports = [
    ./core/packages.nix
    ./core/scripts.nix
    ./core/hardware.nix
    ./desktop/niri-system.nix
    ./desktop/files.nix
    ./desktop/quickshell-system.nix
    ./terminal/ghostty-system.nix
    ./security/agenix.nix
    ./input/keyd-service.nix
    ./dev/docker.nix
    ./network/l2tp.nix
  ];
}
