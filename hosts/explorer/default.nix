{
  lib,
  ...
}:
{
  imports =
    [
      ../../general
      ./hardware
    ]
    ++ lib.map (path: ../../modules + path) [
      /programming
      /boot/grub.nix
      /qq.nix
      /wechat.nix
      /desktop
      /desktop/flavor/cosmic.nix
      /obs-studio.nix
    ];

  networking.hostName = "explorer";
}
