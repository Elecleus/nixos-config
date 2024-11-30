{
  description = "Elecleus's NixOS Flake";

  inputs = {
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?ref=refs/tags/v0.45.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # anyrun.url = "github:Kirottu/anyrun";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      home-manager,
      nixos-cosmic,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = {
        "wanderer" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./applications
            ./desktop
            ./system

            nixos-cosmic.nixosModules.default

            {
              nix.settings = {
                substituters = [
                  "https://cosmic.cachix.org/"
                  "https://nix-community.cachix.org"
                ];
                trusted-public-keys = [
                  "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
                  "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                ];
              };
            }

            # home-manager.nixosModules.home-manager
            # {
            #   home-manager = {
            #     useGlobalPkgs = true;
            #     useUserPackages = true;
            #     extraSpecialArgs = inputs;

            #     users.elecleus = import ./home;
            #   };
            # }
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
                experimental-features = [
                  "nix-command"
                  "flakes"
                ];
              };
            }
            ./wsl
          ];
        };
      };
    };

  nixConfig = {
    extra-substituters = [

      "https://cosmic.cachix.org/"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      # "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      # "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };
}
