{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      #
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland }: {
    nixosConfigurations.wanderer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hyprland.nixosModules.default {
          programs.hyprland.enable = true;
	}
	
	./configuration.nix
      ];
    };
  };
}
