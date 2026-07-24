{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  home.file.".config/ghostty/config".text = ''
    theme=catppuccin-frappe

    keybind = ctrl+shift+h=new_split:left
    keybind = ctrl+shift+l=new_split:right
    keybind = ctrl+shift+j=new_split:down
    keybind = ctrl+shift+k=new_split:up

    keybind = ctrl+h=goto_split:left
    keybind = ctrl+l=goto_split:right
    keybind = ctrl+j=goto_split:down
    keybind = ctrl+k=goto_split:up

    keybind = super+h=resize_split:left,10
    keybind = super+l=resize_split:right,10
    keybind = super+j=resize_split:down,10
    keybind = super+k=resize_split:up,10

    keybind = super+e=equalize_splits
  '';
}
