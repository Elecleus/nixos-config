{ config, lib, pkgs, modulesPath, ... }:

let
  updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  root-btrfs-device = "/dev/disk/by-uuid/d2639486-8273-4152-911d-25d0ecf66e0c";
in
{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = root-btrfs-device;
      fsType = "btrfs";
      options = [ "ssd,discard,noatime,compress=zstd,subvol=@" ];
    };

  fileSystems."/nix" =
    {
      device = root-btrfs-device;
      fsType = "btrfs";
      options = [ "ssd,discard,noatime,compress=zstd,subvol=@nix" ];
    };

  fileSystems."/.snapshots" =
    {
      device = root-btrfs-device;
      fsType = "btrfs";
      options = [ "ssd,discard,noatime,compress=zstd,subvol=@snapshots" ];
    };

  fileSystems."/home" =
    {
      device = root-btrfs-device;
      fsType = "btrfs";
      options = [ "ssd,discard,noatime,compress=zstd,subvol=@home" ];
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/0396-20D5";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu = {
    intel.updateMicrocode = updateMicrocode;
    amd.updateMicrocode = updateMicrocode;
  };
}
