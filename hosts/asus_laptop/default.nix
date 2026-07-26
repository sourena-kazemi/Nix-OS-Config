{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware.nix
    ../../modules
  ];

  networking.hostName = "asus_laptop";
  networking.networkmanager.enable = true;

  users.users.sourena = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets."user-password".path;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [ { command = "ALL"; } ];
    }
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Asia/Tehran";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
