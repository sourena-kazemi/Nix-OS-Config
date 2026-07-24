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
    ./configs/terminal/ghostty.nix
    ./configs/tools/git.nix
  ];

  home.stateVersion = "26.05";
}
