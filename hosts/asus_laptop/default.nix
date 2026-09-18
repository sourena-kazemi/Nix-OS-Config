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

  hardware.i2c.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  users.users.sourena = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets."user-password".path;
    extraGroups = [
      "wheel"
      "networkmanager"
      "i2c"
      "docker"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

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
