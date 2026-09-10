{ ... }:

let
  theme = import ../../theme/theme.nix;
  stripHash = color: builtins.substring 1 (builtins.stringLength color - 1) color;
in
{
  programs.swaylock = {
    enable = true;

    settings = {
      color = stripHash theme.colors.background;
      font = theme.typography.ui;
      font-size = 24;

      indicator-thickness = 8;
      show-failed-attempts = true;
      daemonize = true;

      inside-color = stripHash theme.colors.surface;
      ring-color = stripHash theme.colors.accent;
      key-hl-color = stripHash theme.colors.success;
      line-color = "00000000";

      inside-clear-color = stripHash theme.colors.surface;
      ring-clear-color = stripHash theme.colors.info;
      inside-ver-color = stripHash theme.colors.surface;
      ring-ver-color = stripHash theme.colors.secondary;
      inside-wrong-color = stripHash theme.colors.surface;
      ring-wrong-color = stripHash theme.colors.danger;

      text-color = stripHash theme.colors.primary;
      text-clear-color = stripHash theme.colors.primary;
      text-ver-color = stripHash theme.colors.primary;
      text-wrong-color = stripHash theme.colors.primary;
    };
  };
}
