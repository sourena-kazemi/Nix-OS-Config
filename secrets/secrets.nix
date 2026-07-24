let
  myUser = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKBV703z5kwez9/bhx/orUe3zM54ayTJRdW0KCitjdH sourena@asus_laptop";

  mySystem = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM/IJqqas/tgwire0ryMUadJ3gDppkcnyN6v0Z/fsd0E root@nixos";
in
{
  "user-password.age".publicKeys = [
    myUser
    mySystem
  ];
}
