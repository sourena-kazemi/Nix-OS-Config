{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "toggle-screenrec";
      runtimeInputs = with pkgs; [
        wl-screenrec
        libnotify
      ];
      text = builtins.readFile ../../home/scripts/toggle-screenrec.sh;
    })
  ];
}
