{
  description = "Elecleus's NixOS Flake";

  inputs = {
    nipkgs.url = "github:NixOS/nixpkgs";
    # nixpkgs.follows = "nixos-cosmic/nixpkgs";

    # nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland = {
    #   url = "git+https://github.com/hyprwm/Hyprland?ref=refs/tags/v0.45.2";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # anyrun.url = "github:Kirottu/anyrun";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    daeuniverse.url = "github:daeuniverse/flake.nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      home-manager,
      # nixos-cosmic,
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
            # nixos-cosmic.nixosModules.default

            # home-manager.nixosModules.home-manager
            # {
            #   home-manager = {
            #     useGlobalPkgs = true;
            #     useUserPackages = true;
            #     extraSpecialArgs = inputs;

            #     users.elecleus = import ./home;
            #   };
            # }
            ./hosts/wanderer

            inputs.daeuniverse.nixosModules.dae
            inputs.daeuniverse.nixosModules.daed
          ];
        };

        "explorer" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/explorer

            inputs.daeuniverse.nixosModules.dae
            inputs.daeuniverse.nixosModules.daed

            # Actually Explorer goes lenovo-thinkpad-x390-yoga
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x13-yoga
          ];
        };

      };
    };

  nixConfig = {
    extra-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
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
