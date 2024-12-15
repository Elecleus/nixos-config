{ ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot/efi";
    };
    # grub = {
    #   enable = true;
    #   device = "nodev";
    #   efiSupport = true;
    #   useOSProber = true;
    #   efiInstallAsRemovable = true;
    # };
  };
}
