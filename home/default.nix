{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./configs/desktop/niri.nix
    ./configs/desktop/quickshell.nix
    ./configs/desktop/awww.nix
    ./configs/desktop/mako.nix
    ./configs/session/idle.nix
    ./configs/session/swaylock.nix
    ./configs/terminal/ghostty.nix
    ./configs/tools/git.nix
    ./configs/tools/shell.nix
    ./theme/jsonTheme.nix
    ./theme/darkMode.nix
    ./assets/wallpaper.nix
  ];

  home.stateVersion = "26.05";
}
