{ config, pkgs, ... }:

{
  boot.kernelModules = [
    "i2c-dev"
  ];
}
