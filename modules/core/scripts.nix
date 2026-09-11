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
    (pkgs.writeShellApplication {
      name = "clipboard-history";
      runtimeInputs = with pkgs; [
        cliphist
        fuzzel
        wl-clipboard
      ];
      text = builtins.readFile ../../home/scripts/clipboard-history.sh;
    })
  ];
}
