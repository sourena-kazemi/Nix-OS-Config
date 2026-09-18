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
      "--bind='ctrl-y:execute-silent(readlink -f {} | wl-copy)'"
      "--bind='ctrl-alt-y:execute-silent(wl-copy < {})'"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd"
      "cd"
    ];
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      enter_accept = false;
    };
    flags = [ "--disable-up-arrow" ];
  };
}
