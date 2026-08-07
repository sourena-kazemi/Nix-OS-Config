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
    ./configs/terminal/ghostty.nix
    ./configs/tools/git.nix
    ./theme/jsonTheme.nix
    ./assets/wallpaper.nix
  ];

  home.stateVersion = "26.05";
}
