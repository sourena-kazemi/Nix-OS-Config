{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
