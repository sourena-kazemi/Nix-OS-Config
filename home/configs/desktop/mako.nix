{ ... }:

let
  theme = import ../../theme/theme.nix;
  c = theme.colors;
in
{
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      ignore-timeout = 1;

      background-color = c.surface;
      text-color = c.primary;
      border-color = c.accent;
      border-size = 2;
      border-radius = 8;
      padding = "10";
      margin = "10";
      font = "${theme.typography.ui} 11";
    };
  };
}
