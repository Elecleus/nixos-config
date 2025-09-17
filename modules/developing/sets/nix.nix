{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (config.elecleus.developing.enable && builtins.elem "nix" config.elecleus.developing.sets)
  {
    environment.systemPackages = with pkgs; [
      nil
      nixfmt-rfc-style
    ];
  }
