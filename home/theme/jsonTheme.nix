{ ... }:

let
  theme = import ./theme.nix;
in
{
  xdg.configFile."theme/current.json".text = builtins.toJSON theme;
}
