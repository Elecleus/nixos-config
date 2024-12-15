{
  lib,
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
      /desktop/flavor/hyprland.nix
    ];

  networking.hostName = "explorer";
}
