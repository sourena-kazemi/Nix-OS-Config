{ config, pkgs, ... }:

{
  age.secrets."user-password" = {
    file = ../../secrets/user-password.age;
    owner = "sourena";
    group = "users";
    mode = "600";
  };
}
