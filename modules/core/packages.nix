{
  config,
  pkgs,
  ...
}:

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
    libnotify
    wl-clipboard
    wl-clip-persist
    cliphist
    wl-screenrec

    ghostty

    google-chrome
    vscode
    telegram-desktop
    obsidian

    awww

    brightnessctl
    ddcutil
  ];
}
