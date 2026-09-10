{ config, pkgs, ... }:

let
  lock = "${config.programs.swaylock.package}/bin/swaylock";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  loginctl = "${pkgs.systemd}/bin/loginctl";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
in
{
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        timeout = 300;
        command = "${brightnessctl} set 20%-";
        resumeCommand = "${brightnessctl} set +20%";
      }

      {
        timeout = 600;
        command = "${loginctl} lock-session";
      }

      {
        timeout = 900;
        command = display "off";
        resumeCommand = display "on";
      }

      {
        timeout = 1800;
        command = "${systemctl} suspend";
      }
    ];

    events = {
      before-sleep = "${display "off"}; ${lock}";
      after-resume = display "on";
      lock = "${display "off"}; ${lock}";
      unlock = display "on";
    };
  };
}
