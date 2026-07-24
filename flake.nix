{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
    agenix.url = "github:ryantm/agenix";
    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri,
      agenix,
      quickshell,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;

        overlays = [
          inputs.quickshell.overlays.default
        ];
      };
    in
    {
      nixosConfigurations = {
        asus_laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/asus_laptop/default.nix
            ./hosts/asus_laptop/hardware.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sourena = import ./home/default.nix;
                backupFileExtension = "backup";
              };
            }

            niri.nixosModules.niri

            agenix.nixosModules.default
          ];
        };
      };
    };
}
