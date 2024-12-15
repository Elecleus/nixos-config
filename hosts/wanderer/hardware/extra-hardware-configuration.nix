{ config, ... }:

{
  services.xserver = {
    videoDrivers = [
      "nvidia"
      "amdgpu"
    ];
  };

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot.initrd.kernelModules = [
    "nvidia"
    "amdgpu"
  ];

  boot.kernelModules = [ "kvm-amd" ] ++ config.boot.initrd.kernelModules;

  fileSystems = {
    "/".options = [
      "ssd"
      "discard"
      "noatime"
      "compress=zstd"
    ];
    "/boot/efi".options = [ "noatime" ];
  };
}
