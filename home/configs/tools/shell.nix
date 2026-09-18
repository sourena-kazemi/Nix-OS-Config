{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultOptions = [
      # Copy absolute path of selected entry
      "--bind=ctrl-y:execute-silent(readlink -f {} | wl-copy)"
      # Copy file contents of selected entry
      "--bind=ctrl-alt-y:execute-silent(wl-copy < {})"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd" "cd" ];
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };
}
