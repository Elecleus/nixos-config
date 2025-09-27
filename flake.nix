{
  description = "Elecleus's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:HeitorAugustoLN/nixpkgs/cosmic-beta";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    daeuniverse.url = "github:daeuniverse/flake.nix";
    # mango.url = "github:DreamMaoMao/mango";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      # nixos-cosmic,
      ...
    }@inputs:
    let
      username = "elecleus";
      mylib = import ./lib { lib = nixpkgs.lib; };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations =
        let
          useHome =
            system: modules:
            modules
            ++ import ./home {
              inherit inputs username;
              pkgs = import nixpkgs { inherit system; };
            };
        in
        {
          "wanderer" = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs mylib;
              default-username = username;
            };
            modules = useHome system [
              ./hosts/wanderer

              # inputs.daeuniverse.nixosModules.dae
              inputs.daeuniverse.nixosModules.daed

              # inputs.mango.nixosModules.mango
              # {
              #   programs.mango.enable = true;
              # }

              # (import ./overlays)
              ./modules
            ];
          };

          "explorer" = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = { inherit inputs username; };
            modules = useHome system [
              ./hosts/explorer

              # inputs.daeuniverse.nixosModules.dae
              inputs.daeuniverse.nixosModules.daed

              # Actually Explorer goes lenovo-thinkpad-x390-yoga
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x13-yoga

              # (import ./overlays)
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
    ];
    extra-trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
}
