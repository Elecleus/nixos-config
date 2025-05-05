{ pkgs, ... }:

{
  services.fprintd = {
    enable = true;
    # tod.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-sdk # for older GPUs
    ];
  };

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
