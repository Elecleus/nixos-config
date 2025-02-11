{ ... }:

{
  services.fprintd = {
    enable = true;
    # tod.enable = true;
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
