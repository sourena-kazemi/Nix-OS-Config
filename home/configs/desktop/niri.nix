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
        repeat-delay = 250;
        repeat-rate = 40;
      };

      touchpad = {
        tap = true;
        natural-scroll = false;
        dwt = true;
        click-method = "button-areas";
        accel-speed = 0.2;
        scroll-factor = 1.0;
        tap-button-map = "left-right-middle";
      };

      mouse = {
        accel-speed = 0.0;
      };
    };

    spawn-at-startup = [
      { argv = [ "ghostty" ]; }
    ];

    environment."NIXOS_OZONE_WL" = "1";
  };
}
