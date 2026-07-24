{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./configs/desktop/niri.nix
    ./configs/terminal/ghostty.nix
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "sourena-kazemi";
      email = "kazemisourena@gmail.com";
    };
  };

  home.stateVersion = "26.05";
}
