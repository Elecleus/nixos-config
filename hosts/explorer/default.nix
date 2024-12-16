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
      /boot/system-boot.nix
      /qq.nix
      /desktop
      /desktop/flavor/gnome.nix
    ];

  networking.hostName = "explorer";
}
