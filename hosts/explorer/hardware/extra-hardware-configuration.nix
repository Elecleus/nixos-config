{ ... }:

{
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
