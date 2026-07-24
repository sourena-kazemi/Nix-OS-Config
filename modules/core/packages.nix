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

    fuzzel
    waybar
    mako
    wl-clipboard

    ghostty
  ];
}
