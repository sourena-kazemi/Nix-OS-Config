{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];

  services.upower.enable = true;
}
