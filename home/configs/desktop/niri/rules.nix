{ theme }:

{
  window-rules = [
    {
      geometry-corner-radius = {
        top-left = 8.0;
        top-right = 8.0;
        bottom-left = 8.0;
        bottom-right = 8.0;
      };
      clip-to-geometry = true;
    }
    {
      matches = [
        {
          app-id = "^google-chrome$";
        }
      ];

      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "^code$";
        }
      ];

      open-maximized = true;
    }
  ];
}
