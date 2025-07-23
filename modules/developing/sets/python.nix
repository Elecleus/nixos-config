{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf
  (config.elecleus.developing.enable && builtins.elem "python" config.elecleus.developing.sets)
  {
    environment.systemPackages = with pkgs; [
      conda
      python3Packages.python-lsp-server
    ];
  }
