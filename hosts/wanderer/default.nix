{ lib, ... }:
{
  imports = [
    ../../general
    ./hardware
  ]
  ++ lib.map (path: ../../modules + path) [
    /boot/grub.nix
    /qq.nix
    # /wechat.nix
    /steam.nix
    /container.nix
    /desktop
    # /desktop/flavor/plasma6.nix
    /desktop/flavor/cosmic.nix
    /obs-studio.nix
    # /ollama.nix
    # /sunshine.nix
    /zerotierone.nix
    # /virtualbox.nix
  ];

  networking.hostName = "wanderer";

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

  # services.tftpd.enable = true;

  boot.loader.grub = {
    useOSProber = lib.mkForce false;
    extraEntries = ''
      menuentry 'Windows Boot Manager' --class windows {
          insmod part_gpt
          insmod fat
          search --no-floppy --fs-uuid --set=root 0BE5-CCEC
          chainloader /EFI/Microsoft-shadowed/Boot/bootmgfw.efi
      }
    '';
  };
}
