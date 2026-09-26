{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "sourena-kazemi";
        email = "kazemisourena@gmail.com";
      };
      core.editor="vim";
    };

  };
}
