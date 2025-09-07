{ config, ... }:

{
  services.xserver = {
    videoDrivers = [
      "nvidia"
      "amdgpu"
    ];
  };

  hardware = {
    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      # prime = {
      #   reverseSync.enable = true;
      #   # offload = {
      #   #   enable = true;
      #   #   enableOffloadCmd = true;
      #   # };
      #   amdgpuBusId = "PCI:5:0:0";
      #   nvidiaBusId = "PCI:1:0:0";
      # };
      nvidiaSettings = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
    nvidia-container-toolkit.enable = true;
    # hardware.amdgpu.initrd = true;
  };

  # boot.initrd.kernelModules = [
  #   "nvidia"
  #   "amdgpu"
  # ];

  boot.kernelModules = [
    "kvm-amd"
    "amdgpu"
    "nvidia"
  ]; # ++ config.boot.initrd.kernelModules;

  fileSystems = {
    "/".options = [
      "ssd"
      "discard"
      "noatime"
      "compress=zstd"
    ];
    "/home".options = [
      "ssd"
      "discard"
      "noatime"
      "compress=zstd"
    ];
    "/boot/efi".options = [ "noatime" ];
  };
}
