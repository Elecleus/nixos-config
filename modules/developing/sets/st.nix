{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (config.elecleus.developing.enable && builtins.elem "st" config.elecleus.developing.sets) {
  services.udev.packages = with pkgs; [ stlink ];

  environment.systemPackages = with pkgs; [
    stm32cubemx
    openocd
    cutecom
  ];
}
