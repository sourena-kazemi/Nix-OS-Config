{
  config,
  pkgs,
  ...
}:

{
  programs.niri.settings = {
    input.keyboard.xkb.layout = "us";

    spawn-at-startup = [
      { argv = [ "ghostty" ]; }
      { argv = [ "waybar" ]; }
    ];

    environment."NIXOS_OZONE_WL" = "1";
  };
}
