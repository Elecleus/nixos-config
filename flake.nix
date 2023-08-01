{
  description = "Elecleus's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      "wanderer" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          #./configuration.nix
          ./applications
          ./desktop
          ./system
        ];
      };
    };
  };
}
