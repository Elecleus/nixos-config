{ config, pkgs, lib, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
}
