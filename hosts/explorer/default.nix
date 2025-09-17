{ lib, ... }:
{
  imports = [
    ../../general
    ./hardware
  ]
  ++ lib.map (path: ../../modules + path) [
    /programming
    /programming/stm32.nix
    /boot/grub.nix
    /qq.nix
    /wechat.nix
    /desktop
    /desktop/flavor/plasma6.nix
    /obs-studio.nix
    /zerotierone.nix
  ];

  networking.hostName = "explorer";
}
