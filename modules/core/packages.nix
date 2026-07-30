{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    htop
    tree
    ripgrep

    nixfmt
    qt6.qtdeclarative

    fuzzel
    mako
    wl-clipboard

    ghostty

    google-chrome
    vscode
    telegram-desktop
    obsidian

  ];
}
