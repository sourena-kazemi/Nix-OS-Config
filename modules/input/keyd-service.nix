{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;

    keyboards.default.settings = {
      main = {
        capslock = "enter";
        "f23+leftshift+leftmeta" = "leftmeta"; # copilot key
      };
    };
  };
}
