{
  config,
  pkgs,
  ...
}:

{
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb.layout = "us";
      };

      touchpad = {
        tap = true;
        natural-scroll = false;
        dwt = true;
      };
    };

    spawn-at-startup = [
      { argv = [ "ghostty" ]; }
    ];

    environment."NIXOS_OZONE_WL" = "1";
  };
}
