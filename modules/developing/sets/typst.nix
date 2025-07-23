{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf
  (config.elecleus.developing.enable && builtins.elem "typst" config.elecleus.developing.sets)
  {
    environment.systemPackages = with pkgs; [
      typst
      tinymist
    ];
  }
