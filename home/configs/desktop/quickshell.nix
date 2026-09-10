{
  config,
  pkgs,
  ...
}:

{
  programs.quickshell = {
    enable = true;
    # systemd.enable = true;
    # configs.default = ./quickshell;
    # activeConfig = "default";
  };

  xdg.configFile."quickshell/default" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nixos/home/configs/desktop/quickshell";
  };
}
