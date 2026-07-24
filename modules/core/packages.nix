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
    gh

    nixfmt
    qt6.qtdeclarative

    fuzzel
    mako
    wl-clipboard

    ghostty
  ];
}
