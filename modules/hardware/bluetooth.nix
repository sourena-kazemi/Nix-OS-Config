{ pkgs,... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  security.rtkit.enable = true;

  systemd.services.bluetooth-rfkill-unblock = {
    description = "Unblock Bluetooth radio";

    wantedBy = [ "multi-user.target" ];
    after = [ "bluetooth.service" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
