{ lib, config, ... }:
let
  cfg = config.elecleus.boot;
in
{
  options.elecleus.boot = {
    enable = lib.mkOption {
      description = "Whether enabling system boot configuration.";
      default = true;
    };
    useOSProber = lib.mkOption {
      description = "Whether enabling OSProber.";
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = cfg.useOSProber;
        efiInstallAsRemovable = true;
      };
    };
  };

}
