{
  config,
  lib,
  pkgs,
  ...
}:

lib.mkIf
  (config.elecleus.developing.enable && builtins.elem "cpp" config.elecleus.developing.sets)
  {
    environment.systemPackages = with pkgs; [
      clang-tools
      clang
      gdb
    ];
  }
