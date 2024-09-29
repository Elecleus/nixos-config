{
  description = "Elecleus's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   url = "github:hyprwm/hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # anyrun.url = "github:Kirottu/anyrun";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    home-manager,
    # hyprland,
    # anyrun,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "wanderer" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./applications
          ./desktop
          ./system
        
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;

              users.elecleus = import ./home;
            };
          }
        ];
      };

      "insider" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;

            networking.hostName = "insider";

            nix.settings = {
              substituters = [
                "https://mirrors.bfsu.edu.cn/nix-channels/store"
                # "https://mirror.sjtu.edu.cn/nix-channels/store"
                "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
                "https://mirrors.nju.edu.cn/nix-channels/store"
              ];
              experimental-features = [ "nix-command" "flakes" ];
            };
          }
          ./wsl
        ];
      };
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      # "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      # "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };
}
