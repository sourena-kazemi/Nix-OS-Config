{ pkgs, ... }:

{
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-l2tp
  ];

  services.strongswan.enable = true;

  environment.etc."strongswan.conf".text = "";

  networking.firewall.checkReversePath = "loose";

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  systemd.tmpfiles.rules = [
    "d /etc/ipsec.d 0700 root root -"
  ];
}
