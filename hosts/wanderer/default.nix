{ lib, ... }:
{
  imports =
    [
      ../../general
      ./hardware
    ]
    ++ lib.map (path: ../../modules + path) [
      /programming
      /boot/system-boot.nix
      /qq.nix
      /steam.nix
      /desktop
      /desktop/flavor/plasma6.nix
    ];

  networking.hostName = "wanderer";
}
