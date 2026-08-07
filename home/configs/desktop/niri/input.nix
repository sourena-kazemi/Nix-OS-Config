{
  input = {
    keyboard = {
      xkb.layout = "us,ir";
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
      drag = true;
      drag-lock = true;
    };

    mouse = {
      accel-speed = 0.0;
    };
  };
}
