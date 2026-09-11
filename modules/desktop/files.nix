{ pkgs, ... }:

{
  programs.dconf.enable = true;
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    file-roller
    ffmpegthumbnailer
  ];

  environment.pathsToLink = [ "share/thumbnailers" ];
}
