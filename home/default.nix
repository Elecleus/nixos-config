{
  inputs,
  username,
  pkgs,
  ...
}:
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

      users."${username}".imports = [
        (./. + "/${username}")
        # (
        #   { ... }:
        #   {
        #     wayland.windowManager.mango = {
        #       enable = true;
        #       # settings = ''
        #       #   # see config.conf
        #       # '';
        #       # autostart_sh = ''
        #       #   # see autostart.sh
        #       #   # Note: here no need to add shebang
        #       # '';
        #     };
        #   }
        # )
        # inputs.mango.hmModules.mango
      ];
    };
  }
]
