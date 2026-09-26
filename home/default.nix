{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./configs/system/config.nix
    ./configs/desktop/niri.nix
    ./configs/desktop/quickshell.nix
    ./configs/desktop/awww.nix
    ./configs/desktop/mako.nix
    ./configs/session/idle.nix
    ./configs/session/swaylock.nix
    ./configs/terminal/ghostty.nix
    ./configs/tools/git.nix
    ./configs/tools/shell.nix
    ./configs/tools/vim.nix
    ./theme/jsonTheme.nix
    ./theme/darkMode.nix
    ./theme/cursor.nix
    ./assets/wallpaper.nix
  ];

  home.stateVersion = "26.05";
}
