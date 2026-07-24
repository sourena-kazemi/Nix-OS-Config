{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages."${pkgs.system}".default
  ];
}
