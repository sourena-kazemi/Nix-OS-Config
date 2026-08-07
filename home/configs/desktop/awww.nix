{ config, pkgs, ... }:

{
  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "Awww wallpaper daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.wallpaper = {
    Unit = {
      Description = "Set desktop wallpaper";
      After = [ "awww-daemon.service" ];
      Requires = [ "awww-daemon.service" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";

      ExecStart = ''
        ${pkgs.awww}/bin/awww \
          img \
          ${config.home.homeDirectory}/.config/theme/wallpaper.png \
          --transition-type none
      '';
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

}
