{ pkgs, ... }:

with pkgs; {
  services.udev.packages = [ stlink ];

  environment.systemPackages = [ stm32cubemx openocd cutecom ];
}
