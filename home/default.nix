{ inputs, username, ... }:
let
  home-manager = inputs.home-manager;
in
[
  home-manager.nixosModules.home-manager

  {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = inputs;

      users.elecleus = import (./. + "/${username}") {};
    };
  }
]
