{ lib, ... }:
{
  imports =
    [
      ../../general
      ./hardware
    ]
    ++ lib.map (path: ../../modules + path) [
      /programming
      /programming/android.nix
      /boot/system-boot.nix
      /qq.nix
      /wechat.nix
      /steam.nix
      /docker.nix
      /desktop
      /desktop/flavor/plasma6.nix
      /obs-studio.nix
    ];

  networking.hostName = "wanderer";
}
