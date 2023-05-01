{ config, pkgs, lib, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sdb";
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
      efi.efiSysMountPoint = "/boot/efi";
    };
  };
}
