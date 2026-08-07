{ theme }:

{
  layout = {
    preset-column-widths = [
      { proportion = 0.33; }
      { proportion = 0.50; }
      { proportion = 0.66; }
      { proportion = 1.00; }
    ];
    preset-window-heights = [
      { proportion = 0.33; }
      { proportion = 0.50; }
      { proportion = 0.66; }
      { proportion = 1.00; }
    ];

    gaps = 16;

    focus-ring = {
      width = 2;
      active.color = theme.colors.accent;
      inactive.color = theme.colors.border;
      urgent.color = theme.colors.danger;
    };

    border = {
      width = 1;
      active.color = theme.colors.border;
      inactive.color = theme.colors.surface;
      urgent.color = theme.colors.danger;
    };

    shadow = {
      enable = true;
      softness = 30;
      spread = 5;
      offset = {
        x = 0;
        y = 5;
      };
      draw-behind-window = true;
      color = theme.colors.shadow;
    };

    tab-indicator = {
      hide-when-single-tab = true;
      place-within-column = true;
      gap = 5;
      width = 3;
      length = {
        total-proportion = 1.0;
      };
      position = "top";
      gaps-between-tabs = 2;
      corner-radius = 4;
      active.color = theme.colors.accent;
      inactive.color = theme.colors.border;
      urgent.color = theme.colors.danger;
    };

    insert-hint = {
      display.color = theme.colors.accentSemi;
    };
  };
}
