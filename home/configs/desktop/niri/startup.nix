{
  spawn-at-startup = [
    {
      command = [ "quickshell" ];
    }
    {
      command = [ "awww-daemon" ];
    }
    {
      command = [ "blueman-applet" ];
    }
    { command = [ "xwayland-satellite" ]; }
    {
      command = [
        "wl-clip-persist"
        "--clipboard"
        "regular"
        "--ignore-event-on-error"
        "--selection-size-limit"
        "1048576"
        "--all-mime-type-regex"
        "(?i)^(?!(?:image|audio|video|font|model)/).+"
      ];
    }
    {
      command = [
        "wl-paste"
        "--type"
        "text"
        "--watch"
        "cliphist"
        "store"
      ];
    }
    {
      command = [
        "wl-paste"
        "--type"
        "image"
        "--watch"
        "cliphist"
        "store"
      ];
    }
  ];
}
