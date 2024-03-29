{ config, lib, pkgs, modulesPath, ... }:

let
  updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
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
      device = "/dev/disk/by-uuid/d9959329-d357-40d4-a740-6368fb76f666";
      fsType = "btrfs";
      options = [ "ssd,discard,noatime,compress=zstd" ];
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/F102-D954";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu = {
    intel.updateMicrocode = updateMicrocode;
    amd.updateMicrocode = updateMicrocode;
  };
}
