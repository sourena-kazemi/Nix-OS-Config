{ config, pkgs, ... }:

let
  theme = import ../../../theme/theme.nix;
in
{
  programs.niri.settings =
    (import ./input.nix)
    // (import ./binds.nix { inherit config pkgs; })
    // (import ./layout.nix { inherit theme; })
    // (import ./rules.nix { inherit theme; })
    // (import ./startup.nix)
    // {
      hotkey-overlay.skip-at-startup = true;
      environment."NIXOS_OZONE_WL" = "1";
    };
}
