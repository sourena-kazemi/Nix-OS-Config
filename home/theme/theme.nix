let
  themes = {
    poimandres = import ./themes/poimandres.nix;

    # catppuccin = import ./themes/catppuccin.nix;
  };

  active = "poimandres";
in
themes.${active}
