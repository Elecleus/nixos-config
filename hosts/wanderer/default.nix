{ lib, ... }:
{
  imports =
    [
      ../../general
      ./hardware
    ]
    ++ lib.map (path: ../../modules + path) [
      /programming
      # /programming/android.nix
      /boot/grub.nix
      /qq.nix
      /wechat.nix
      /steam.nix
      /docker.nix
      /desktop
      /desktop/flavor/plasma6.nix
      # /desktop/flavor/cosmic.nix
      /obs-studio.nix
      # /ollama.nix
    ];

  networking.hostName = "wanderer";
}
