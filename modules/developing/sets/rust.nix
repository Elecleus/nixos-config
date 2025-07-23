{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf
  (config.elecleus.developing.enable && builtins.elem "rust" config.elecleus.developing.sets)
  {
    environment = {
      systemPackages = with pkgs; [ rustup ];
    };
  }
