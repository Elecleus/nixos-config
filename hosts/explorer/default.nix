{ lib, ... }:
{
  imports = [
    ../../general
    ./hardware
  ]
  ++ lib.map (path: ../../modules + path) [
    /boot/grub.nix
    # /qq.nix
    # /wechat.nix
    /desktop
    /desktop/flavor/cosmic.nix
    # /obs-studio.nix
    /zerotierone.nix
  ];

  networking.hostName = "explorer";

  elecleus.developing = {
    enable = true;
    sets = [
      "cpp"
      "nix"
      "python"
      "rust"
      # "st"
      "typst"
    ];
  };
}
