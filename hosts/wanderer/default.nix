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
      /wechat.nix
      /steam.nix
      /docker.nix
      /desktop
      /desktop/flavor/plasma6.nix
    ];

  networking.hostName = "wanderer";
}
